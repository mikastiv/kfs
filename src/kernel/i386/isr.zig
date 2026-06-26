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

pub const HandlerFn = *const fn (frame: *const InterruptFrame) void;

const intel_reserved_exception_count = 32;

var handlers: [interrupts.count]?HandlerFn = @splat(null);

pub const vectorStubs = blk: {
    var table: [interrupts.count]*const fn () callconv(.naked) noreturn = undefined;

    for (0..interrupts.count) |i| {
        table[i] = generateVectorStub(i);
    }

    break :blk table;
};

fn generateVectorStub(comptime interrupt: u32) *const fn () callconv(.naked) noreturn {
    return struct {
        fn func() callconv(.naked) noreturn {
            const info = interrupts.vector_info[interrupt];
            if (!info.has_error_code) {
                // push dummy error code
                asm volatile ("push $0x00");
            }

            // push interrupt number and jump to common code
            asm volatile (
                \\ push %[int]
                \\ jmp %[common:P]
                :
                : [int] "i" (interrupt),
                  [common] "X" (&vectorCommon),
            );
        }
    }.func;
}

fn vectorCommon() callconv(.naked) void {
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
    const info = interrupts.vector_info[frame.interrupt];

    if (handlers[frame.interrupt]) |handler| {
        handler(frame);
    } else if (frame.interrupt >= intel_reserved_exception_count) {
        framebuffer.print("Unhandled Interrupt {d}\n", .{frame.interrupt});
    } else {
        framebuffer.print("Unhandled Exception {d}: {s}\n", .{ frame.interrupt, info.description });
        if (info.has_error_code) {
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
