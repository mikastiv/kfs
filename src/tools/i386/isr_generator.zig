const std = @import("std");
const assert = std.debug.assert;

const interrupts = @import("interrupts");

pub fn main(init: std.process.Init) !void {
    const io = init.io;
    const arena = init.arena;
    const allocator = arena.allocator();

    const args = try init.minimal.args.toSlice(allocator);

    var output_filepath: ?[]const u8 = null;

    {
        var i: usize = 1;
        while (i < args.len) : (i += 1) {
            const arg = args[i];
            if (std.mem.cutPrefix(u8, arg, "--output-file=")) |filename| {
                output_filepath = filename;
            } else {
                std.process.fatal("unknown argument: {s}", .{arg});
            }
        }

        if (output_filepath == null) std.process.fatal("missing output file", .{});
    }

    const output_file = try std.Io.Dir.cwd().createFile(io, output_filepath.?, .{});
    defer output_file.close(io);

    var buffer: [2048]u8 = undefined;
    var output_writer = output_file.writer(io, &buffer);
    const writer = &output_writer.interface;

    try writer.writeAll("const isr = @import(\"isr.zig\").commonEntry;\n\n");

    for (0..256) |i| {
        try writer.print(
            \\pub export fn isr{d}() callconv(.naked) void {{
            \\    asm volatile (
            \\
        , .{i});
        if (std.mem.findScalar(u32, &interrupts.with_error_code, @intCast(i)) == null) {
            try writer.writeAll(
                \\        \\ push $0x00
                \\
            );
        }
        try writer.print(
            \\        \\ push $0x{X:0>2}
            \\        \\ jmp %[isr:P]
            \\        :
            \\        : [isr] "X" (&isr),
            \\    );
            \\}}
            \\
            \\
        , .{i});
    }

    try writer.flush();
}
