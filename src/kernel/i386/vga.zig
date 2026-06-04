const std = @import("std");
const assert = std.debug.assert;

pub const Color = enum(u4) {
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

pub const EntryColor = packed struct(u8) {
    fg: Color,
    bg: Color,

    pub const default: EntryColor = .{ .fg = .light_gray, .bg = .black };
};

pub fn entry(char: u8, color: EntryColor) u16 {
    const col: u16 = @as(u8, @bitCast(color));
    return col << 8 | char;
}
