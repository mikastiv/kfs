const std = @import("std");

const tty = @import("tty.zig");

pub fn panic(msg: []const u8, error_return_trace: ?*std.builtin.StackTrace, first_trace_addr: ?usize) noreturn {
    _ = first_trace_addr;
    _ = error_return_trace;
    tty.print("KERNEL PANIC: {s}\n", .{msg});

    while (true) {
        asm volatile ("hlt");
    }
}
