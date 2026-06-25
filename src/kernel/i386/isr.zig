const std = @import("std");
const assert = std.debug.assert;

const framebuffer = @import("framebuffer.zig");
const gdt = @import("gdt.zig");
const interrupts = @import("interrupts.zig");

pub const InterruptFrame = extern struct {
    ds: u32,
    edi: u32,
    esi: u32,
    ebp: u32,
    esp: u32,
    ebx: u32,
    edx: u32,
    ecx: u32,
    eax: u32,
    interrupt: u32,
    error_code: u32,
    eip: u32,
    cs: u32,
    eflags: u32,
};

pub export fn commonEntry() callconv(.naked) void {
    asm volatile (
        \\ pusha
        \\
        \\ mov %%ds, %%eax
        \\ push %%eax
        \\
        \\ mov %[segment], %%ax
        \\ mov %%ax, %%ds
        \\ mov %%ax, %%es
        \\ mov %%ax, %%fs
        \\ mov %%ax, %%gs
        \\
        \\ push %%esp
        \\
        \\ call %[handleInterrupt:P]
        \\
        \\ add $4, %%esp
        \\
        \\ pop %%eax
        \\ mov %%ax, %%ds
        \\ mov %%ax, %%es
        \\ mov %%ax, %%fs
        \\ mov %%ax, %%gs
        \\
        \\ popa
        \\ add $8, %%esp
        \\
        \\ iret
        :
        : [segment] "i" (gdt.data_segment),
          [handleInterrupt] "X" (&handleInterrupt),
    );
}

export fn handleInterrupt(frame: *const InterruptFrame) callconv(.c) void {
    if (handlers[frame.interrupt]) |handler| {
        handler(frame);
    } else if (frame.interrupt >= 32) {
        framebuffer.print("unhandled interrupt: 0x{x:0>2} ({d})\n", .{ frame.interrupt, frame.interrupt });
    } else {
        framebuffer.print("unhandled exception: 0x{x:0>2} ({d})\n", .{ frame.interrupt, frame.interrupt });
        if (std.mem.findScalar(u32, &interrupts.with_error_code, frame.interrupt) != null) {
            framebuffer.print("error code: {d}\n", .{frame.error_code});
        }
        framebuffer.print("eax: {x:0>8}, ebx: {x:0>8}, ecx: {x:0>8}, edx: {x:0>8}, ebp: {x:0>8}, esp: {x:0>8}\n", .{
            frame.eax,
            frame.ebx,
            frame.ecx,
            frame.edx,
            frame.ebp,
            frame.esp,
        });
        framebuffer.print("esi: {x:0>8}, edi: {x:0>8}, eip: {x:0>8}, cs: {x:0>8}, eflags: {x:0>8}\n", .{
            frame.esi,
            frame.edi,
            frame.eip,
            frame.cs,
            frame.eflags,
        });

        @panic("unhandled exception");
    }

    // NOTE: test code
    const idt = @import("idt.zig");
    if (frame.interrupt == 11) {
        idt.enableGate(50);
    }
}

pub const HandlerFn = *const fn (frame: *const InterruptFrame) void;

var handlers: [interrupts.count]?HandlerFn = @splat(null);
