const std = @import("std");
const assert = std.debug.assert;

const gdt = @import("gdt.zig");
const isr = @import("isr.zig");
const isr_entries = @import("isr_entries.zig");
const interrupts = @import("interrupts.zig");

const IdtEntry = packed struct(u64) {
    offset_lo: u16,
    segment_selector: u16,
    reserved: u8 = 0,
    attributes: Attributes,
    offset_hi: u16,

    const Attributes = packed struct(u8) {
        gate_type: enum(u4) {
            zero = 0,
            task = 5,
            interrupt_16 = 6,
            trap_16 = 7,
            interrupt_32 = 14,
            trap_32 = 15,
        },
        zero: u1 = 0,
        privilege_level: enum(u2) {
            ring0 = 0,
            ring1 = 1,
            ring2 = 2,
            ring3 = 3,
        },
        present: bool = false,
    };
};

const IdtDescriptor = packed struct(u48) {
    limit: u16,
    base: u32,
};

var idt: [interrupts.count]IdtEntry = @splat(std.mem.zeroes(IdtEntry));

pub fn enableGate(interrupt: u8) void {
    idt[interrupt].attributes.present = true;
}

pub fn disableGate(interrupt: u8) void {
    idt[interrupt].attributes.present = false;
}

pub fn init() void {
    const descriptor: IdtDescriptor = .{
        .limit = @sizeOf(@TypeOf(idt)) - 1,
        .base = @intFromPtr(&idt),
    };

    load(&descriptor);

    inline for (0..interrupts.count) |i| {
        @setEvalBranchQuota(50000);
        const name = std.fmt.comptimePrint("isr{d}", .{i});
        const ptr = &@field(isr_entries, name);
        setGate(@intCast(i), ptr, gdt.code_segment, .{ .gate_type = .interrupt_32, .privilege_level = .ring0 });
        enableGate(@intCast(i));
    }

    disableGate(50);
}

fn setGate(
    interrupt: u8,
    entry_point: anytype,
    segment_descriptor: u16,
    attributes: IdtEntry.Attributes,
) void {
    const offset: u32 = @intFromPtr(entry_point);

    idt[interrupt] = .{
        .offset_lo = @intCast(offset & 0xffff),
        .segment_selector = segment_descriptor,
        .attributes = attributes,
        .offset_hi = @intCast((offset >> 16) & 0xffff),
    };
}

fn load(descriptor: *const IdtDescriptor) void {
    asm volatile (
        \\ lidt (%[ptr])
        :
        : [ptr] "r" (descriptor),
    );
}
