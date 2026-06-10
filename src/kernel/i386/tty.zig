const std = @import("std");
const assert = std.debug.assert;

const vga = @import("vga.zig");

const Tty = @This();

const width = 80;
const height = 25;
const size = width * height;
const buffer = @as([*]volatile u16, @ptrFromInt(0xb8000))[0..size];

var row: usize = 0;
var column: usize = 0;
var color: vga.EntryColor = .default;

pub fn init() void {
    row = 0;
    column = 0;
    color = .default;
    clear();
}

pub fn clear() void {
    @memset(buffer, vga.entry(' ', color));
}

pub fn setColor(fg: vga.Color, bg: vga.Color) void {
    color = .{ .fg = fg, .bg = bg };
}

pub fn putChar(char: u8) void {
    switch (char) {
        '\n' => {
            column = 0;
            incrementRow();
        },
        else => {
            putCharAt(char, column, row);
            incrementColumn();
        },
    }
}

pub fn printString(str: []const u8) void {
    for (str) |char| {
        putChar(char);
    }
}

pub fn print(comptime fmt: []const u8, args: anytype) void {
    var w = writer(&.{});
    w.print(fmt, args) catch {};
}

fn putCharAt(char: u8, x: usize, y: usize) void {
    const index = y * width + x;
    buffer[index] = vga.entry(char, color);
}

fn incrementColumn() void {
    column += 1;
    if (column >= width) {
        column = 0;
        incrementRow();
    }
}

fn incrementRow() void {
    row += 1;
    if (row >= height) {
        row = height - 1;
        scroll();
    }
}

fn scroll() void {
    @memmove(buffer[0 .. size - width], buffer[width..]);
    @memset(buffer[width * (height - 1) ..], vga.entry(' ', color));
}

fn drain(w: *std.Io.Writer, data: []const []const u8, splat: usize) !usize {
    assert(data.len != 0);

    var consumed: usize = 0;

    if (w.end != 0) {
        printString(w.buffered());
        w.end = 0;
    }

    for (data[0 .. data.len - 1]) |bytes| {
        printString(bytes);
        consumed += bytes.len;
    }

    const pattern = data[data.len - 1];
    if (pattern.len > 0) {
        for (0..splat) |_| {
            printString(pattern);
        }
    }

    consumed += pattern.len * splat;

    return consumed;
}

fn writer(buf: []u8) std.Io.Writer {
    return .{
        .buffer = buf,
        .end = 0,
        .vtable = &.{
            .drain = drain,
        },
    };
}
