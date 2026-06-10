const std = @import("std");
const assert = std.debug.assert;

pub const panic = @import("panic.zig").panic;

const multiboot = @import("multiboot.zig");
const tty = @import("tty.zig");
const framebuffer = @import("framebuffer.zig");

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

noinline fn kmain(magic: u32, info: *multiboot.Info) callconv(.c) noreturn {
    tty.init();
    tty.print("magic: {x}\n", .{magic});
    framebuffer.init(info);

    framebuffer.print("Hello, World!\n", .{});
    framebuffer.print("Hello, Kernel!\n", .{});
    for (0..22) |i| {
        framebuffer.print("{d}\n", .{i});
    }

    asm volatile ("cli");
    while (true) {
        asm volatile ("hlt");
    }
}
