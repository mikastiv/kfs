{
  description = "zig flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    zig-flake.url = "github:silversquirl/zig-flake";
    zig-flake.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      zig-flake,
    }:
    let
      forAllSystems =
        f:
        builtins.mapAttrs (
          system: pkgs: f pkgs zig-flake.packages.${system}.zig_0_16_0
        ) nixpkgs.legacyPackages;
    in
    {
      devShells = forAllSystems (
        pkgs: zig: {
          default = pkgs.mkShellNoCC {
            nativeBuildInputs = with pkgs; [
              zig
              zig.zls
              qemu
              llvmPackages_21.llvm
              grub2
              xorriso
            ];
          };
        }
      );
    };
}
