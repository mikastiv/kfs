const std = @import("std");
const assert = std.debug.assert;

pub const psf1 = struct {
    pub const magic = 0x0436;

    pub const Header = extern struct {
        magic: u16,
        font_mode: packed struct(u8) {
            big: bool, // false = 256 entries, true = 512
            unicode_table: bool,
            sequences: bool, // contains unicode sequences
            padding: u5,
        },
        glyph_height: u8,
    };
};

pub const psf2 = struct {
    pub const magic = 0x864ab572;
    pub const max_glyphs = 512;

    pub const Header = extern struct {
        magic: u32,
        version: u32,
        header_size: u32,
        flags: packed struct(u32) { unicode_table: bool, padding: u31 },
        num_glyphs: u32,
        bytes_per_glyph: u32,
        height: u32,
        width: u32,
    };

    pub const Psf2Font = struct {
        glyphs_bytes: []u8,
        glyphs_table: [max_glyphs]u16,
        unicode_table: ?[max_glyphs]u16,
    };

    pub fn parse(bytes: []const u8) Psf2Font {
        const header: *const Header = @ptrCast(@alignCast(bytes.ptr));
        assert(header.magic == magic);
    }
};
