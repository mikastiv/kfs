const std = @import("std");
const assert = std.debug.assert;

const multiboot = @import("multiboot.zig");
const vga = @import("vga.zig");

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

noinline fn kmain(magic: u32, multiboot_info: *multiboot.Info) callconv(.c) noreturn {
    vga.init();

    vga.print("magic: {x}\n", .{magic});
    vga.print("has framebuffer: {any}", .{multiboot_info.flags.framebuffer});

    for (0..24) |i| {
        vga.print("{d}\n", .{i});
    }

    asm volatile ("cli");
    while (true) {
        asm volatile ("hlt");
    }
}
