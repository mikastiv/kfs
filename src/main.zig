const std = @import("std");
const assert = std.debug.assert;

const multiboot = @import("multiboot.zig");
const vga = @import("vga.zig");

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
    height: u32,

    fn putPixel(self: Framebuffer, x: u32, y: u32, r: u8, g: u8, b: u8) void {
        const index = (y * self.pitch) + (x * self.bpp / 8);
        switch (self.bpp) {
            32, 24 => {
                self.pixels[index + 0] = b;
                self.pixels[index + 1] = g;
                self.pixels[index + 2] = r;
                if (self.bpp == 32) {
                    self.pixels[index + 3] = 0xff;
                }
            },
            else => @panic("unsupported bpp"),
        }
    }
};

noinline fn kmain(magic: u32, info: *multiboot.Info) callconv(.c) noreturn {
    vga.init();

    vga.print("magic: {x}\n", .{magic});

    const raw_pixels: [*]u8 = @ptrFromInt(@as(u32, @truncate(info.framebuffer.addr)));
    const framebuffer_size = info.framebuffer.pitch * info.framebuffer.height;
    const pixels: []u8 = raw_pixels[0..framebuffer_size];

    const framebuffer: Framebuffer = .{
        .pixels = pixels,
        .bpp = info.framebuffer.bpp,
        .pitch = info.framebuffer.pitch,
        .height = info.framebuffer.height,
    };

    for (0..16) |i| {
        framebuffer.putPixel(5, i, 0xff, 0, 0xff);
    }

    asm volatile ("cli");
    while (true) {
        asm volatile ("hlt");
    }
}
