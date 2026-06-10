const std = @import("std");

const Bootloader = enum {
    multiboot,
    limine,
};

pub fn build(b: *std.Build) void {
    const Target = std.Target.x86;
    const target = b.resolveTargetQuery(.{
        .cpu_arch = .x86,
        .os_tag = .freestanding,
        .abi = .none,
        .cpu_features_add = Target.featureSet(&.{.soft_float}),
        .cpu_features_sub = Target.featureSet(&.{ .avx, .avx2, .sse, .sse2, .mmx }),
    });
    const optimize = b.standardOptimizeOption(.{});
    const host_target = b.standardTargetOptions(.{});

    const psf_to_bin = b.addExecutable(.{
        .name = "psf_to_bin",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/tools/psf_font_parser.zig"),
            .target = host_target,
            .optimize = optimize,
        }),
    });

    const console_font_path = "fonts/ter-v32n.psf";
    const psf_step = b.addRunArtifact(psf_to_bin);
    psf_step.addPrefixedFileArg("--input-file=", b.path(console_font_path));
    const console_font = psf_step.addPrefixedOutputFileArg("--output-file=", console_font_path);

    const kernel = b.addExecutable(.{
        .name = "kfs",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/kernel/i386/main.zig"),
            .target = target,
            .optimize = optimize,
            .code_model = .kernel,
            .strip = false,
        }),
    });
    kernel.root_module.addAnonymousImport("console_font", .{ .root_source_file = console_font });
    b.installArtifact(kernel);

    const kernel_path = kernel.getEmittedBin();
    const iso = b.getInstallPath(.bin, "kfs.iso");

    const run_cmd = b.addRunArtifact(kernel);
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the kernel");
    run_step.dependOn(&run_cmd.step);

    kernel.setLinkerScript(b.path("src/kernel/i386/linker.ld"));

    const grub_wf = b.addWriteFiles();
    _ = grub_wf.add("boot/grub/grub.cfg",
        \\set timeout=0
        \\set default="0"
        \\menuentry "kfs" {
        \\    multiboot /boot/kfs
        \\}
    );
    _ = grub_wf.addCopyFile(kernel_path, "boot/kfs");
    const isodir = grub_wf.getDirectory();

    const grub_mkrescue = b.addSystemCommand(&.{"grub-mkrescue"});
    grub_mkrescue.addArgs(&.{ "-o", iso });
    grub_mkrescue.addDirectoryArg(isodir);
    b.getInstallStep().dependOn(&grub_mkrescue.step);

    const qemu_cmd = b.addSystemCommand(&.{"qemu-system-x86_64"});
    qemu_cmd.addArgs(&.{ "-cdrom", iso });
    qemu_cmd.step.dependOn(&grub_mkrescue.step);

    run_cmd.step.dependOn(&qemu_cmd.step);
}
