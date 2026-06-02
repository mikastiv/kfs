const std = @import("std");
const assert = std.debug.assert;

const multiboot = struct {
    const magic = 0x1badb002;

    const Header = extern struct {
        magic: u32,
        flags: Flags,
        checksum: u32,
        addr: extern struct {
            header: u32,
            load: u32,
            load_end: u32,
            bss_end: u32,
            entry: u32,
        },
        video: extern struct {
            mode_type: enum(u32) { linear = 0, ega_text = 1, _ },
            width: u32,
            height: u32,
            depth: u32,
        },

        const Flags = packed struct(u32) {
            module_align: bool,
            mem_info: bool,
            video_mode: bool,
            padding: u29 = 0,

            const default: Flags = .{
                .module_align = true,
                .mem_info = true,
                .video_mode = true,
            };
        };

        fn calculateChecksum(flags: Flags) u32 {
            const f: u32 = @bitCast(flags);
            return ~(multiboot.magic +% f) +% 1;
        }
    };

    const AoutSymbolTable = extern struct {
        tabsize: u32,
        strsize: u32,
        addr: u32,
        reserved: u32,
    };

    const ElfSectionHeaderTable = extern struct {
        num: u32,
        size: u32,
        addr: u32,
        shndx: u32,
    };

    // https://www.gnu.org/software/grub/manual/multiboot/multiboot.html#Example-OS-code
    const Info = extern struct {
        flags: packed struct(u32) {
            mem: bool,
            boot_device: bool,
            cmdline: bool,
            mods: bool,
            aout_symbol: bool,
            elf_section: bool,
            mmap: bool,
            drives: bool,
            config_table: bool,
            boot_loader_name: bool,
            apm_table: bool,
            vbe: bool,
            framebuffer: bool,
            padding: u19,
        },

        mem_lower: u32,
        mem_upper: u32,

        boot_device: u32,

        cmdline: u32,

        mods_count: u32,
        mods_addr: u32,

        u: extern union {
            aout_sym: AoutSymbolTable,
            elf_sec: ElfSectionHeaderTable,
        },

        mmap_length: u32,
        mmap_addr: u32,

        drives_length: u32,
        drives_addr: u32,

        config_table: u32,

        boot_loader_name: u32,

        apm_table: u32,

        vbe: extern struct {
            control_info: u32,
            mode_info: u32,
            mode: u16,
            interface_seg: u16,
            interface_off: u16,
            interface_len: u16,
        },

        framebuffer: extern struct {
            addr: u64,
            pitch: u32,
            width: u32,
            height: u32,
            bpp: u8,
            type: enum(u8) { indexed = 0, rgb = 1, ega_text = 2, _ },
            mode: extern union {
                palette: extern struct {
                    palette_addr: u32,
                    palette_num_colors: u16,
                },
                rgb: extern struct {
                    red_field_position: u8,
                    red_mask_size: u8,
                    green_field_position: u8,
                    green_mask_size: u8,
                    blue_field_position: u8,
                    blue_mask_size: u8,
                },
            },
        },
    };
};

export const multiboot_header: multiboot.Header align(4) linksection(".multiboot") = .{
    .magic = multiboot.magic,
    .flags = .default,
    .checksum = multiboot.Header.calculateChecksum(.default),
    .addr = undefined,
    .video = .{
        .mode_type = .linear,
        .width = 1024,
        .height = 768,
        .depth = 32,
    },
};

var stack_bytes: [16 * 1024]u8 align(16) linksection(".bss") = undefined;

export fn _start() callconv(.naked) noreturn {
    asm volatile (
        \\ movl %[stack_top], %%esp
        \\ movl %%esp, %%ebp
        \\ pushl %%ebx
        \\ pushl %%eax
        \\ call %[kmain:P]
        :
        : [stack_top] "i" (stack_bytes[stack_bytes.len..].ptr),
          [kmain] "X" (&kmain),
    );
}

const vga_width = 80;
const vga_height = 25;
const vga_size = vga_width * vga_height;
const vga_buffer: [*]volatile u16 = @ptrFromInt(0xb8000);

var terminal_row: usize = 0;
var terminal_column: usize = 0;
var terminal_color: VgaColor = .default;
const terminal_buffer: []volatile u16 = vga_buffer[0..vga_size];

const Color = enum(u4) {
    black = 0,
    blue = 1,
    green = 2,
    cyan = 3,
    red = 4,
    magenta = 5,
    brown = 6,
    light_gray = 7,
    dark_gray = 8,
    light_blue = 9,
    light_green = 10,
    light_cyan = 11,
    light_red = 12,
    light_magenta = 13,
    light_brown = 14,
    white = 15,
};

const VgaColor = packed struct(u8) {
    fg: Color,
    bg: Color,

    const default: VgaColor = .{ .fg = .light_gray, .bg = .black };
};

fn vgaEntry(char: u8, color: VgaColor) u16 {
    const col: u16 = @as(u8, @bitCast(color));
    return col << 8 | char;
}

fn init() void {
    terminal_row = 0;
    terminal_column = 0;
    terminal_color = .default;
    clear();
}

fn clear() void {
    @memset(terminal_buffer, vgaEntry(' ', terminal_color));
}

fn putCharAt(char: u8, color: VgaColor, x: usize, y: usize) void {
    const index = y * vga_width + x;
    terminal_buffer[index] = vgaEntry(char, color);
}

fn putChar(char: u8) void {
    putCharAt(char, terminal_color, terminal_column, terminal_row);
    terminal_column += 1;
    if (terminal_column == vga_width) {
        terminal_column = 0;
        terminal_row += 1;
        if (terminal_row == vga_height) {
            terminal_row = 0;
        }
    }
}

fn printString(str: []const u8) void {
    for (str) |char| {
        putChar(char);
    }
}

fn drain(w: *std.Io.Writer, data: []const []const u8, splat: usize) !usize {
    assert(data.len != 0);

    var consumed: usize = 0;

    if (w.end != 0) {
        printString(w.buffered());
        w.end = 0;
    }

    for (data[0 .. data.len - 1]) |bytes| {
        printString(bytes);
        consumed += bytes.len;
    }

    const pattern = data[data.len - 1];
    if (pattern.len > 0) {
        for (0..splat) |_| {
            printString(pattern);
        }
    }

    consumed += pattern.len * splat;

    return consumed;
}

fn writer(buffer: []u8) std.Io.Writer {
    return .{
        .buffer = buffer,
        .end = 0,
        .vtable = &.{
            .drain = drain,
        },
    };
}

fn print(comptime fmt: []const u8, args: anytype) void {
    var w = writer(&.{});
    w.print(fmt, args) catch {};
}

noinline fn kmain(
    magic: u32,
    multiboot_info: *multiboot.Info,
) callconv(.c) noreturn {
    init();

    print("{x}", .{magic});
    print(" {any}", .{multiboot_info.flags.vbe});
    asm volatile ("cli");
    while (true) {
        asm volatile ("hlt");
    }
}
