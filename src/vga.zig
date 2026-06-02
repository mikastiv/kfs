const std = @import("std");
const assert = std.debug.assert;

const width = 80;
const height = 25;
const size = width * height;
const buffer: [*]volatile u16 = @ptrFromInt(0xb8000);

var terminal_row: usize = 0;
var terminal_column: usize = 0;
var terminal_color: VgaColor = .default;
const terminal_buffer: []volatile u16 = buffer[0..size];

const Color = enum(u4) {
    black = 0,
    blue = 1,
    green = 2,
    cyan = 3,
    red = 4,
    magenta = 5,
    brown = 6,
    light_gray = 7,
    dark_gray = 8,
    light_blue = 9,
    light_green = 10,
    light_cyan = 11,
    light_red = 12,
    light_magenta = 13,
    light_brown = 14,
    white = 15,
};

const VgaColor = packed struct(u8) {
    fg: Color,
    bg: Color,

    const default: VgaColor = .{ .fg = .light_gray, .bg = .black };
};

fn vgaEntry(char: u8, color: VgaColor) u16 {
    const col: u16 = @as(u8, @bitCast(color));
    return col << 8 | char;
}

pub fn init() void {
    terminal_row = 0;
    terminal_column = 0;
    terminal_color = .default;
    clear();
}

pub fn clear() void {
    @memset(terminal_buffer, vgaEntry(' ', terminal_color));
}

fn putCharAt(char: u8, color: VgaColor, x: usize, y: usize) void {
    const index = y * width + x;
    terminal_buffer[index] = vgaEntry(char, color);
}

fn incrementColumn() void {
    terminal_column += 1;
    if (terminal_column >= width) {
        terminal_column = 0;
        incrementRow();
    }
}

fn incrementRow() void {
    terminal_row += 1;
    if (terminal_row >= height) {
        terminal_row = height - 1;
        scroll();
    }
}

fn scroll() void {
    @memmove(terminal_buffer[0 .. size - width], terminal_buffer[width..]);
    @memset(terminal_buffer[width * (height - 1) ..], vgaEntry(' ', terminal_color));
}

pub fn putChar(char: u8) void {
    switch (char) {
        '\n' => {
            terminal_column = 0;
            incrementRow();
        },
        else => {
            putCharAt(char, terminal_color, terminal_column, terminal_row);
            incrementColumn();
        },
    }
}

pub fn printString(str: []const u8) void {
    for (str) |char| {
        putChar(char);
    }
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

pub fn print(comptime fmt: []const u8, args: anytype) void {
    var w = writer(&.{});
    w.print(fmt, args) catch {};
}
