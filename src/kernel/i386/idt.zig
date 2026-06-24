const std = @import("std");
const assert = std.debug.assert;

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
        present: bool,
    };
};

const IdtDescriptor = packed struct(u48) {
    limit: u16,
    base: u32,
};

fn load(descriptor: *const IdtDescriptor) void {
    asm volatile (
        \\ lidt (%[ptr])
        :
        : [ptr] "r" (descriptor),
    );
}

export var idt: [256]IdtEntry = @splat(std.mem.zeroes(IdtEntry));

fn setGate(
    interrupt: u8,
    entry_point: *anyopaque,
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
}
