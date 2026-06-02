const std = @import("std");

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

    const kernel = b.addExecutable(.{
        .name = "kfs",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
            .code_model = .kernel,
            .strip = false,
        }),
    });
    kernel.setLinkerScript(b.path("src/linker.ld"));
    b.installArtifact(kernel);

    const kernel_path = kernel.getEmittedBin();
    const iso = b.getInstallPath(.bin, "kfs.iso");

    const wf = b.addWriteFiles();
    _ = wf.addCopyFile(b.path("grub.cfg"), "boot/grub/grub.cfg");
    _ = wf.addCopyFile(kernel_path, "boot/kfs");
    const isodir = wf.getDirectory();

    const grub_mkrescue = b.addSystemCommand(&.{"grub-mkrescue"});
    grub_mkrescue.addArgs(&.{ "-o", iso });
    grub_mkrescue.addDirectoryArg(isodir);
    b.getInstallStep().dependOn(&grub_mkrescue.step);

    const qemu_cmd = b.addSystemCommand(&.{"qemu-system-x86_64"});
    qemu_cmd.addArgs(&.{ "-cdrom", iso });
    qemu_cmd.step.dependOn(&grub_mkrescue.step);

    const run_cmd = b.addRunArtifact(kernel);
    run_cmd.step.dependOn(&qemu_cmd.step);
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
