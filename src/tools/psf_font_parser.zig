const std = @import("std");
const assert = std.debug.assert;

pub const Font = struct {
    glyph_count: u32,
    glyph_height: u32,
    glyph_width: u32,
    bytes_per_glyph: u32,
    bytes_per_row: u32,
    glyphs: []const u8,
    unicode_map: ?[]const u16,
};

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

    pub fn parse(allocator: std.mem.Allocator, bytes: []const u8) !Font {
        const header: *const Header = @ptrCast(@alignCast(bytes.ptr));
        assert(header.magic == magic);
        assert(!header.font_mode.sequences);

        const glyph_count: u32 = if (header.font_mode.big) 512 else 256;
        const glyphs = bytes[@sizeOf(Header) .. @sizeOf(Header) + glyph_count * header.glyph_height];
        const unicode_table: []align(1) const u16 = std.mem.bytesAsSlice(u16, bytes[@sizeOf(Header) + glyphs.len ..]);

        const unicode_map: ?[]u16 = blk: {
            if (header.font_mode.unicode_table) {
                const map = try allocator.alloc(u16, std.math.maxInt(u16));
                @memset(map, 0xffff);

                var glyph: u16 = 0;
                var i: usize = 0;
                while (i < unicode_table.len) : (i += 1) {
                    const entry = unicode_table[i];

                    // Skip unicode sequences
                    if (entry == 0xfffe) {
                        while (unicode_table[i] != 0xffff) {
                            i += 1;
                        }
                    }

                    if (entry == 0xffff) {
                        glyph += 1;
                        continue;
                    }

                    map[entry] = glyph;
                }

                break :blk map;
            } else {
                break :blk null;
            }
        };

        return .{
            .glyph_count = glyph_count,
            .glyph_width = 8,
            .glyph_height = header.glyph_height,
            .bytes_per_glyph = header.glyph_height,
            .bytes_per_row = 1,
            .glyphs = glyphs,
            .unicode_map = unicode_map,
        };
    }
};

pub const psf2 = struct {
    pub const magic = 0x864ab572;

    pub const Header = extern struct {
        magic: u32,
        version: u32,
        header_size: u32,
        flags: packed struct(u32) {
            unicode_table: bool,
            padding: u31,
        },
        num_glyphs: u32,
        bytes_per_glyph: u32,
        height: u32,
        width: u32,
    };

    pub fn parse(allocator: std.mem.Allocator, bytes: []const u8) !Font {
        const header: *const Header = @ptrCast(@alignCast(bytes.ptr));
        assert(header.magic == magic);
        assert(header.version == 0);
        assert(header.header_size == 32);
        assert(@sizeOf(Header) == header.header_size);

        const bytes_per_row = (header.width + 7) / 8;
        const glyphs = bytes[@sizeOf(Header) .. @sizeOf(Header) + header.num_glyphs * header.bytes_per_glyph];
        const unicode_table = bytes[@sizeOf(Header) + glyphs.len ..];

        const unicode_map: ?[]u16 = blk: {
            if (header.flags.unicode_table) {
                const map = try allocator.alloc(u16, std.math.maxInt(u16));
                @memset(map, 0xffff);

                var glyph: u16 = 0;
                var i: u16 = 0;
                while (i < unicode_table.len) : (i += 1) {
                    var unicode: u21 = unicode_table[i];

                    // Skip unicode sequences
                    if (unicode == 0xfe) {
                        while (unicode_table[i] != 0xff) {
                            i += 1;
                        }
                    }

                    if (unicode == 0xff) {
                        glyph += 1;
                        continue;
                    }

                    // 0b1xxxxxxx
                    if (unicode & 0x80 != 0) {
                        if (unicode & 0x20 == 0) {
                            // 0b110xxxxx
                            unicode = try std.unicode.utf8Decode2(unicode_table[i .. i + 2][0..2].*);
                            i += 1;
                        } else if (unicode & 0x10 == 0) {
                            // 0b1110xxxx
                            unicode = try std.unicode.utf8Decode3(unicode_table[i .. i + 3][0..3].*);
                            i += 2;
                        } else if (unicode & 0x08 == 0) {
                            // 0b11110xxx
                            unicode = try std.unicode.utf8Decode4(unicode_table[i .. i + 4][0..4].*);
                            i += 3;
                        } else {
                            assert(false);
                        }
                    }

                    map[unicode] = glyph;
                }

                break :blk map;
            } else {
                break :blk null;
            }
        };

        return .{
            .glyph_count = header.num_glyphs,
            .glyph_width = header.width,
            .glyph_height = header.height,
            .bytes_per_glyph = header.bytes_per_glyph,
            .bytes_per_row = bytes_per_row,
            .glyphs = glyphs,
            .unicode_map = unicode_map,
        };
    }
};

pub fn main(init: std.process.Init) !void {
    const io = init.io;
    const arena = init.arena;
    const allocator = arena.allocator();

    const args = try init.minimal.args.toSlice(allocator);

    var input_filepath: ?[]const u8 = null;
    var output_filepath: ?[]const u8 = null;

    {
        var i: usize = 1;
        while (i < args.len) : (i += 1) {
            const arg = args[i];
            if (std.mem.cutPrefix(u8, arg, "--input-file=")) |filename| {
                input_filepath = filename;
            } else if (std.mem.cutPrefix(u8, arg, "--output-file=")) |filename| {
                output_filepath = filename;
            } else {
                std.process.fatal("unknown argument: {s}", .{arg});
            }
        }

        if (input_filepath == null) std.process.fatal("missing input file", .{});
        if (output_filepath == null) std.process.fatal("missing output file", .{});
    }

    const data = try std.Io.Dir.cwd().readFileAlloc(
        io,
        input_filepath.?,
        allocator,
        .limited(1024 * 1024 * 64),
    );

    const is_psf1 = psf1.magic == std.mem.bytesToValue(u16, data[0..2]);
    const is_psf2 = psf2.magic == std.mem.bytesToValue(u32, data[0..4]);
    const font = if (is_psf1)
        try psf1.parse(allocator, data)
    else if (is_psf2)
        try psf2.parse(allocator, data)
    else
        std.process.fatal("not a psf file", .{});

    const output = try std.Io.Dir.cwd().createFile(io, output_filepath.?, .{});
    defer output.close(io);

    var buffer: [2048]u8 = undefined;
    var output_writer = output.writer(io, &buffer);
    const writer = &output_writer.interface;

    try writer.writeInt(u32, font.bytes_per_row, .little);
    try writer.writeInt(u32, font.glyph_height, .little);

    // Only care about ASCII printable characters
    for (' '..'~' + 1) |c| {
        var glyph: u16 = @intCast(c);
        if (font.unicode_map) |unicode| {
            glyph = unicode[glyph];
        }

        const start = glyph * font.bytes_per_glyph;
        const glyph_bytes = font.glyphs[start .. start + font.bytes_per_glyph];

        try writer.writeAll(glyph_bytes);

        // var window = std.mem.window(u8, glyph_bytes, font.bytes_per_row, font.bytes_per_row);
        // while (window.next()) |bytes| {
        //     for (bytes) |byte| {
        //         for (0..8) |i| {
        //             const bit = 7 - i;
        //             const mask: u8 = @as(u8, 1) << @intCast(bit);
        //             if (byte & mask != 0) {
        //                 std.debug.print("1", .{});
        //             } else {
        //                 std.debug.print("0", .{});
        //             }
        //         }
        //     }

        //     std.debug.print("\n", .{});
        // }
    }

    try writer.flush();
}
