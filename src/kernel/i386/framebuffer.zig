const std = @import("std");
const assert = std.debug.assert;

const multiboot = @import("multiboot.zig");

const font: ConsoleFont = .init(@embedFile("console_font"));

// These should not change after init
var bpp: u32 = 0;
var pitch: u32 = 0;
var width: u32 = 0;
var height: u32 = 0;
var cursor_width: u32 = 0;
var cursor_height: u32 = 0;
var red_index: u32 = 0;
var green_index: u32 = 0;
var blue_index: u32 = 0;

var pixels: []u8 = undefined;

var fg: Color = .white;
var bg: Color = .black;

var column: usize = 0;
var row: usize = 0;

const ConsoleFont = struct {
    bytes_per_row: u32,
    bytes_per_glyph: u32,
    glyph_height: u32,
    glyphs: []const u8,

    fn init(bytes: []const u8) ConsoleFont {
        const bytes_per_row = std.mem.readInt(u32, bytes[0..4], .little);
        const glyph_height = std.mem.readInt(u32, bytes[4..8], .little);
        const bytes_per_glyph = bytes_per_row * glyph_height;
        const glyphs = bytes[8..];

        return .{
            .bytes_per_row = bytes_per_row,
            .bytes_per_glyph = bytes_per_glyph,
            .glyph_height = glyph_height,
            .glyphs = glyphs,
        };
    }
};

pub const Color = struct {
    r: u8,
    g: u8,
    b: u8,

    pub const black: Color = .{ .r = 0, .g = 0, .b = 0 };
    pub const white: Color = .{ .r = 0xff, .g = 0xff, .b = 0xff };
    pub const red: Color = .{ .r = 0xff, .g = 0, .b = 0 };
    pub const green: Color = .{ .r = 0, .g = 0xff, .b = 0 };
    pub const blue: Color = .{ .r = 0, .g = 0, .b = 0xff };
    pub const magenta: Color = .{ .r = 0xff, .g = 0, .b = 0xff };
    pub const cyan: Color = .{ .r = 0, .g = 0xff, .b = 0xff };
    pub const yellow: Color = .{ .r = 0xff, .g = 0xff, .b = 0 };
    pub const orange: Color = .{ .r = 0xff, .g = 0xa5, .b = 0 };

    pub fn toInt(self: Color) u32 {
        var result: u32 = 0;
        result |= @as(u32, self.r) << @intCast(red_index * 8);
        result |= @as(u32, self.g) << @intCast(green_index * 8);
        result |= @as(u32, self.b) << @intCast(blue_index * 8);
        return result;
    }
};

pub fn init(info: *const multiboot.Info) void {
    assert(info.framebuffer.type == .rgb);
    assert(info.framebuffer.mode.rgb.red_mask_size == 8);
    assert(info.framebuffer.mode.rgb.green_mask_size == 8);
    assert(info.framebuffer.mode.rgb.blue_mask_size == 8);
    assert(info.framebuffer.bpp == 32);

    fg = .orange;
    bg = .black;

    const raw_pixels: [*]u8 = @ptrFromInt(@as(u32, @truncate(info.framebuffer.addr)));
    const framebuffer_size = info.framebuffer.pitch * info.framebuffer.height;
    pixels = raw_pixels[0..framebuffer_size];

    red_index = info.framebuffer.mode.rgb.red_field_position / 8;
    green_index = info.framebuffer.mode.rgb.green_field_position / 8;
    blue_index = info.framebuffer.mode.rgb.blue_field_position / 8;

    bpp = info.framebuffer.bpp;
    pitch = info.framebuffer.pitch;
    width = info.framebuffer.width;
    height = info.framebuffer.height;

    cursor_width = (pitch / bpp) / font.bytes_per_row;
    cursor_height = height / font.glyph_height;

    column = 0;
    row = 0;

    clear();
}

pub fn clear() void {
    @memset(std.mem.bytesAsSlice(u32, pixels), bg.toInt());
    row = 0;
    column = 0;
}

pub fn putPixel(x: u32, y: u32, color: Color) void {
    assert(x < width);
    assert(y < height);

    const index = (y * pitch) + (x * bpp / 8);
    pixels[index + blue_index] = color.b;
    pixels[index + green_index] = color.g;
    pixels[index + red_index] = color.r;
}

pub fn putCharAt(char: u8, cx: u32, cy: u32) void {
    assert(std.ascii.isPrint(char));
    assert(cx < cursor_width);
    assert(cy < cursor_height);

    const first_char = ' '; // The binary file has only printable ascii starting with space.
    const glyph_start = font.bytes_per_glyph * (char - first_char);
    const glyph = font.glyphs[glyph_start .. glyph_start + font.bytes_per_glyph];
    var it = std.mem.window(u8, glyph, font.bytes_per_row, font.bytes_per_row);

    const x_start = cx * font.bytes_per_row * 8;
    const y_start = cy * font.glyph_height;
    var y: usize = y_start;
    while (it.next()) |window| {
        var x: usize = x_start;
        for (window) |byte| {
            for (0..8) |i| {
                const bit = 7 - i;
                const mask = @as(u8, 1) << @intCast(bit);
                if (byte & mask != 0) {
                    putPixel(x, y, fg);
                } else {
                    putPixel(x, y, bg);
                }

                x += 1;
            }
        }

        y += 1;
    }
}

pub fn setColor(foreground: Color, background: Color) void {
    fg = foreground;
    bg = background;
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

fn incrementColumn() void {
    column += 1;
    if (column >= cursor_width) {
        column = 0;
        incrementRow();
    }
}

fn incrementRow() void {
    row += 1;
    if (row >= cursor_height) {
        row = cursor_height - 1;
        scroll();
    }
}

fn scroll() void {
    const scanline_size = pitch * font.glyph_height;
    const frambuffer_size = pitch * height;
    @memmove(pixels[0 .. frambuffer_size - scanline_size], pixels[scanline_size..]);

    const last_row = std.mem.bytesAsSlice(u32, pixels[frambuffer_size - scanline_size ..]);
    @memset(last_row, bg.toInt());
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
