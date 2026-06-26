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

pub export fn vectorCommon() callconv(.naked) void {
    asm volatile (
        \\ pusha                 # push eax, ecx, edx, ebx, esp, ebp, esi, edi
        \\
        \\ mov %%ds, %%eax       # push ds
        \\ push %%eax
        \\
        \\ mov %[segment], %%ax  # load kernel data segment
        \\ mov %%ax, %%ds
        \\ mov %%ax, %%es
        \\ mov %%ax, %%fs
        \\ mov %%ax, %%gs
        \\
        \\ push %%esp            # push frame ptr for c callconv
        \\
        \\ call %[handleInterrupt:P]
        \\
        \\ add $4, %%esp         # pop esp
        \\
        \\ pop %%eax             # restore segments
        \\ mov %%ax, %%ds
        \\ mov %%ax, %%es
        \\ mov %%ax, %%fs
        \\ mov %%ax, %%gs
        \\
        \\ popa                  # restore registers
        \\ add $8, %%esp         # pop interrupt number and error code
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
    } else if (frame.interrupt >= intel_reserved_exception_count) {
        framebuffer.print("Unhandled Interrupt: 0x{x:0>2} ({d})\n", .{ frame.interrupt, frame.interrupt });
    } else {
        framebuffer.print("Unhandled Exception: Vector 0x{x:0>2} ({d}): {s}\n", .{ frame.interrupt, frame.interrupt, exception_descriptions[frame.interrupt] });
        if (std.mem.findScalar(u32, &interrupts.with_error_code, frame.interrupt) != null) {
            framebuffer.print("Error Code: {d}\n", .{frame.error_code});
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
}

const intel_reserved_exception_count = 32;
const exception_descriptions: [intel_reserved_exception_count][]const u8 = .{
    "Divide Error",
    "Debug Exception",
    "NMI Interrupt",
    "Breakpoint",
    "Overflow",
    "BOUND Range Exceeded",
    "Invalid Opcode",
    "Device Not Available (No Math Coprocessor)",
    "Double Fault",
    "Coprocessor Segment Overrun",
    "Invalid TSS",
    "Segment Not Present",
    "Stack-Segment Fault",
    "General Protection",
    "Page Fault",
    "Intel Reserved",
    "x87 FPU Floating-Point Error (Math Fault)",
    "Alignment Check",
    "Machine Check",
    "SIMD Floating-Point Exception",
    "Virtualization Exception",
    "Control Protection Exception",
    "",
    "",
    "",
    "",
    "",
    "",
    "Hypervisor Injection Exception",
    "VMM Communication Exception",
    "Security Exception",
    "",
};

pub const HandlerFn = *const fn (frame: *const InterruptFrame) void;

var handlers: [interrupts.count]?HandlerFn = @splat(null);
