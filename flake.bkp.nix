{
  description = "dwm flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.dwm = nixpkgs.lib.mkShell {
      buildInputs = [
        (nixpkgs.dwm.overrideAttrs (oldAttrs: rec {
          src = ./.;
        }))
      ];
    };
  };
}

