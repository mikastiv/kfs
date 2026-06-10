const std = @import("std");
const assert = std.debug.assert;

pub const panic = @import("panic.zig").panic;

const multiboot = @import("multiboot.zig");
const tty = @import("tty.zig");

const font_binary = @embedFile("console_font");

const multiboot_flags: multiboot.Header.Flags = .{
    .module_align = true,
    .mem_info = true,
    .video_mode = true,
};

export const multiboot_header: multiboot.Header align(4) linksection(".multiboot") = .{
    .magic = multiboot.magic,
    .flags = multiboot_flags,
    .checksum = multiboot.Header.calculateChecksum(multiboot_flags),
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

const Framebuffer = struct {
    pixels: []u8,
    bpp: u32,
    pitch: u32,
    width: u32,
    height: u32,
    font: ConsoleFont,

    fn putPixel(self: *const Framebuffer, x: u32, y: u32, color: Color) void {
        assert(x < self.width);
        assert(y < self.height);

        const index = (y * self.pitch) + (x * self.bpp / 8);
        switch (self.bpp) {
            32, 24 => {
                self.pixels[index + 0] = color.b;
                self.pixels[index + 1] = color.g;
                self.pixels[index + 2] = color.r;
                if (self.bpp == 32) {
                    self.pixels[index + 3] = 0xff;
                }
            },
            else => @panic("unsupported bpp"),
        }
    }

    fn putChar(self: *const Framebuffer, char: u16, cx: u32, cy: u32, fg: Color, bg: Color) void {
        const glyph_start = self.font.bytes_per_glyph * (char - ' ');
        const glyph = self.font.glyphs[glyph_start .. glyph_start + self.font.bytes_per_glyph];
        var it = std.mem.window(u8, glyph, self.font.bytes_per_row, self.font.bytes_per_row);

        const x_start = cx * self.font.bytes_per_row * 8;
        const y_start = cy * self.font.glyph_height;
        var y: usize = y_start;
        while (it.next()) |window| {
            var x: usize = x_start;
            for (window) |byte| {
                for (0..8) |i| {
                    const bit = 7 - i;
                    const mask = @as(u8, 1) << @intCast(bit);
                    if (byte & mask != 0) {
                        self.putPixel(x, y, fg);
                    } else {
                        self.putPixel(x, y, bg);
                    }

                    x += 1;
                }
            }

            y += 1;
        }
    }
};

const ConsoleFont = struct {
    bytes_per_row: u32,
    bytes_per_glyph: u32,
    glyph_height: u32,
    glyphs: []const u8,

    fn init(bytes: []const u8) ConsoleFont {
        const bytes_per_row = std.mem.readInt(u32, bytes[0..4], .little);
        const glyph_height = std.mem.readInt(u32, bytes[4..8], .little);
        const bytes_per_glyph = bytes_per_row * glyph_height;
        const glyphs = bytes[8..];

        return .{
            .bytes_per_row = bytes_per_row,
            .bytes_per_glyph = bytes_per_glyph,
            .glyph_height = glyph_height,
            .glyphs = glyphs,
        };
    }
};

const Color = struct {
    r: u8,
    g: u8,
    b: u8,

    const black: Color = .{ .r = 0, .g = 0, .b = 0 };
    const white: Color = .{ .r = 0xff, .g = 0xff, .b = 0xff };
    const red: Color = .{ .r = 0xff, .g = 0, .b = 0 };
    const green: Color = .{ .r = 0, .g = 0xff, .b = 0 };
    const blue: Color = .{ .r = 0, .g = 0, .b = 0xff };
    const magenta: Color = .{ .r = 0xff, .g = 0, .b = 0xff };
    const cyan: Color = .{ .r = 0, .g = 0xff, .b = 0xff };
    const yellow: Color = .{ .r = 0xff, .g = 0xff, .b = 0 };
};

noinline fn kmain(magic: u32, info: *multiboot.Info) callconv(.c) noreturn {
    tty.init();
    tty.print("magic: {x}\n", .{magic});

    const console_font: ConsoleFont = .init(font_binary);

    const raw_pixels: [*]u8 = @ptrFromInt(@as(u32, @truncate(info.framebuffer.addr)));
    const framebuffer_size = info.framebuffer.pitch * info.framebuffer.height;
    const pixels: []u8 = raw_pixels[0..framebuffer_size];
    // TODO: check rgb masks
    assert(info.framebuffer.type == .rgb);

    const framebuffer: Framebuffer = .{
        .pixels = pixels,
        .bpp = info.framebuffer.bpp,
        .pitch = info.framebuffer.pitch,
        .width = info.framebuffer.width,
        .height = info.framebuffer.height,
        .font = console_font,
    };

    for ("Hello, World!", 0..) |c, i| {
        framebuffer.putChar(c, i, 0, .black, .white);
    }

    asm volatile ("cli");
    while (true) {
        asm volatile ("hlt");
    }
}
