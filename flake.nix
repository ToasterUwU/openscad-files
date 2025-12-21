{
  description = "Dev shell for openscad-files: openscad (unstable), clang-format, bash";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    bosl2 = {
      url = "github:BelfrySCAD/BOSL2";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      bosl2,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            openscad
            bash
          ];
          shellHook = ''
            mkdir -p .lib
            cp -rf --no-preserve=mode ${bosl2} .lib/BOSL2
          '';
        };
      }
    );
}
