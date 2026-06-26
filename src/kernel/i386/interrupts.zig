pub const count = 256;

pub const VectorInfo = struct {
    mnemonic: []const u8,
    ty: Type,
    description: []const u8,
    has_error_code: bool,

    const Type = enum { interrupt, fault, trap, abort };

    pub const init: VectorInfo = .{
        .mnemonic = "---",
        .ty = .interrupt,
        .description = "",
        .has_error_code = false,
    };
};

pub const vector_info: [count]VectorInfo = blk: {
    var table: [count]VectorInfo = @splat(.init);

    table[0] = .{ .mnemonic = "#DE", .ty = .fault, .has_error_code = false, .description = "Divide Error" };
    table[1] = .{ .mnemonic = "#DB", .ty = .fault, .has_error_code = false, .description = "Debug Exception" };
    table[2] = .{ .mnemonic = "---", .ty = .fault, .has_error_code = false, .description = "NMI Interrupt" };
    table[3] = .{ .mnemonic = "#BP", .ty = .fault, .has_error_code = false, .description = "Breakpoint" };
    table[4] = .{ .mnemonic = "#OF", .ty = .fault, .has_error_code = false, .description = "Overflow" };
    table[5] = .{ .mnemonic = "#BR", .ty = .fault, .has_error_code = false, .description = "BOUND Range Exceeded" };
    table[6] = .{ .mnemonic = "#UD", .ty = .fault, .has_error_code = false, .description = "Invalid Opcode" };
    table[7] = .{ .mnemonic = "#NM", .ty = .fault, .has_error_code = false, .description = "Device Not Available (No Math Coprocessor)" };
    table[8] = .{ .mnemonic = "#DF", .ty = .fault, .has_error_code = true, .description = "Double Fault" };
    table[9] = .{ .mnemonic = "---", .ty = .fault, .has_error_code = false, .description = "Coprocessor Segment Overrun" };
    table[10] = .{ .mnemonic = "#TS", .ty = .fault, .has_error_code = true, .description = "Invalid TSS" };
    table[11] = .{ .mnemonic = "#NP", .ty = .fault, .has_error_code = true, .description = "Segment Not Present" };
    table[12] = .{ .mnemonic = "#SS", .ty = .fault, .has_error_code = true, .description = "Stack-Segment Fault" };
    table[13] = .{ .mnemonic = "#GP", .ty = .fault, .has_error_code = true, .description = "General Protection" };
    table[14] = .{ .mnemonic = "#PF", .ty = .fault, .has_error_code = true, .description = "Page Fault" };
    table[15] = .{ .mnemonic = "---", .ty = .fault, .has_error_code = false, .description = "Reserved" };
    table[16] = .{ .mnemonic = "#MF", .ty = .fault, .has_error_code = false, .description = "x87 FPU Floating-Point Error (Math Fault)" };
    table[17] = .{ .mnemonic = "#AC", .ty = .fault, .has_error_code = true, .description = "Alignment Check" };
    table[18] = .{ .mnemonic = "#MC", .ty = .fault, .has_error_code = false, .description = "Machine Check" };
    table[19] = .{ .mnemonic = "#XM", .ty = .fault, .has_error_code = false, .description = "SIMD Floating-Point Exception" };
    table[20] = .{ .mnemonic = "#VE", .ty = .fault, .has_error_code = false, .description = "Virtualization Exception" };
    table[21] = .{ .mnemonic = "#CP", .ty = .fault, .has_error_code = true, .description = "Control Protection Exception" };
    table[22] = .{ .mnemonic = "---", .ty = .fault, .has_error_code = false, .description = "Reserved" };
    table[23] = .{ .mnemonic = "---", .ty = .fault, .has_error_code = false, .description = "Reserved" };
    table[24] = .{ .mnemonic = "---", .ty = .fault, .has_error_code = false, .description = "Reserved" };
    table[25] = .{ .mnemonic = "---", .ty = .fault, .has_error_code = false, .description = "Reserved" };
    table[26] = .{ .mnemonic = "---", .ty = .fault, .has_error_code = false, .description = "Reserved" };
    table[27] = .{ .mnemonic = "---", .ty = .fault, .has_error_code = false, .description = "Reserved" };
    table[28] = .{ .mnemonic = "#HV", .ty = .fault, .has_error_code = false, .description = "Hypervisor Injection Exception" };
    table[29] = .{ .mnemonic = "#VC", .ty = .fault, .has_error_code = true, .description = "VMM Communication Exception" };
    table[30] = .{ .mnemonic = "#SX", .ty = .fault, .has_error_code = true, .description = "Security Exception" };
    table[31] = .{ .mnemonic = "---", .ty = .fault, .has_error_code = false, .description = "" };

    break :blk table;
};
