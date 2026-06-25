const std = @import("std");
const assert = std.debug.assert;

const framebuffer = @import("framebuffer.zig");
const gdt = @import("gdt.zig");

pub const interrupts_with_error_code = [_]u32{ 8, 10, 11, 12, 13, 14, 17, 21, 29, 30 };

const InterruptFrame = extern struct {
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

pub fn isr0() callconv(.naked) void {
    asm volatile (
        \\ push $0
        \\ push $0
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub fn isr1() callconv(.naked) void {
    asm volatile (
        \\ push $0
        \\ push $1
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub fn isr2() callconv(.naked) void {
    asm volatile (
        \\ push $0
        \\ push $2
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub fn isr3() callconv(.naked) void {
    asm volatile (
        \\ push $0
        \\ push $3
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub fn isr4() callconv(.naked) void {
    asm volatile (
        \\ push $0
        \\ push $4
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

fn isr() callconv(.naked) void {
    asm volatile ("pusha");
    asm volatile (
        \\ xor %%eax, %%eax
        \\ mov %%ds, %%eax
        \\ push %%eax
        \\
        \\ mov %[segment], %%ds
        \\ mov %[segment], %%es
        \\ mov %[segment], %%fs
        \\ mov %[segment], %%gs
        \\
        \\ push %%esp
        \\
        \\ call %[handler:P]
        \\
        \\ add $4, %%esp
        \\
        \\ pop %%eax
        \\ mov %%ds, %%ax
        \\ mov %%es, %%ax
        \\ mov %%fs, %%ax
        \\ mov %%gs, %%ax
        \\
        \\ popa
        \\ add $8, %%esp
        \\
        \\ iret
        :
        : [segment] "{eax}" (gdt.data_segment),
          [handler] "X" (&handler),
    );
}

fn handler(frame: *const InterruptFrame) callconv(.c) void {
    framebuffer.print("int: {d}\n", .{frame.interrupt});
    if (std.mem.findScalar(u32, &interrupts_with_error_code, frame.interrupt) != null) {
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
}
