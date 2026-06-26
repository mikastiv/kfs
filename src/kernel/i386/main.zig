const std = @import("std");
const assert = std.debug.assert;

pub const panic = @import("panic.zig").panic;

const multiboot = @import("multiboot.zig");
const tty = @import("tty.zig");
const framebuffer = @import("framebuffer.zig");
const gdt = @import("gdt.zig");
const idt = @import("idt.zig");

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
        \\ movl %[stack_top], %%esp   # load stack ptr
        \\ movl %%esp, %%ebp
        \\ pushl %%ebx                # push multiboot magic
        \\ pushl %%eax                # push multiboot info
        \\ call %[kmain:P]
        :
        : [stack_top] "i" (stack_bytes[stack_bytes.len..].ptr),
          [kmain] "X" (&kmain),
    );
}

noinline fn kmain(magic: u32, info: *multiboot.Info) callconv(.c) noreturn {
    asm volatile ("cli");

    gdt.init();
    idt.init();

    tty.init();
    framebuffer.init(info);

    framebuffer.print("multiboot magic: 0x{x}\n", .{magic});
    framebuffer.print("Hello, Kernel!\n", .{});

    asm volatile ("int $64");

    while (true) {
        asm volatile ("hlt");
    }
}
