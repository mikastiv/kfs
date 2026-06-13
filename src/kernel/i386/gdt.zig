const std = @import("std");
const assert = std.debug.assert;

const GdtEntry = packed struct(u64) {
    limit_lo: u16,
    base_lo: u24,
    access: Access,
    limit_hi: u4,
    flags: Flags,
    base_hi: u8,

    const Access = packed struct(u8) {
        accessed: bool = false,
        readable_or_writable: bool,
        direction_or_conforming: bool,
        executable: bool,
        descriptor_type: enum(u1) {
            task_state = 0,
            code_or_data = 1,
        },
        descriptor_privilege: enum(u2) {
            ring0 = 0,
            ring1 = 1,
            ring2 = 2,
            ring3 = 3,
        },
        present: bool,

        const zero: Access = std.mem.zeroes(Access);
    };

    const Flags = packed struct(u4) {
        reserved: bool = false,
        @"64bit": bool,
        size: enum(u1) {
            @"16bit" = 0,
            @"32bit" = 1,
        },
        granularity: enum(u1) {
            @"1b" = 0,
            @"4Kb" = 1,
        },

        const zero: Flags = std.mem.zeroes(Flags);
    };

    fn init(base: u32, limit: u20, access: Access, flags: Flags) GdtEntry {
        return .{
            .limit_lo = @intCast(limit & 0xffff),
            .limit_hi = @intCast((limit >> 16) & 0xf),
            .base_lo = @intCast(base & 0xffffff),
            .base_hi = @intCast((base >> 24) & 0xff),
            .access = access,
            .flags = flags,
        };
    }
};

const GdtDescriptor = extern struct {
    limit: u16 align(1),
    base: [*]GdtEntry align(1),
};

pub fn init() void {
    load(&gdt_descriptor, code_segment, data_segment);
}

fn load(descriptor: *const GdtDescriptor, code_seg: u16, data_seg: u16) void {
    asm volatile (
        \\ lgdt (%[ptr])
        \\ mov %[data], %%ds
        \\ mov %[data], %%es
        \\ mov %[data], %%fs
        \\ mov %[data], %%gs
        \\ mov %[data], %%ss
        \\ pushl %[code]
        \\ pushl $1f
        \\ lretl
        \\1:
        :
        : [ptr] "r" (descriptor),
          [code] "r" (@as(u32, code_seg)),
          [data] "r" (data_seg),
    );
}

const code_segment = 1 * @sizeOf(GdtEntry);
const data_segment = 2 * @sizeOf(GdtEntry);

var gdt: [3]GdtEntry linksection(".gdt") = .{
    // Null descriptor
    .init(0, 0, GdtEntry.Access.zero, GdtEntry.Flags.zero),

    // Kernel 32bit code segment
    .init(
        0,
        0xfffff,
        .{
            .readable_or_writable = true,
            .executable = true,
            .direction_or_conforming = false,
            .descriptor_type = .code_or_data,
            .descriptor_privilege = .ring0,
            .present = true,
        },
        .{
            .@"64bit" = false,
            .size = .@"32bit",
            .granularity = .@"4Kb",
        },
    ),

    // Kernel 32bit data segment
    .init(
        0,
        0xfffff,
        .{
            .readable_or_writable = true,
            .executable = false,
            .direction_or_conforming = false,
            .descriptor_type = .code_or_data,
            .descriptor_privilege = .ring0,
            .present = true,
        },
        .{
            .@"64bit" = false,
            .size = .@"32bit",
            .granularity = .@"4Kb",
        },
    ),
};

const gdt_descriptor: GdtDescriptor = .{
    .limit = @sizeOf(@TypeOf(gdt)) - 1,
    .base = &gdt,
};
