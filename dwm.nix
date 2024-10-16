{ pkgs
, ...
}:
  pkgs.stdenv.mkDerivation rec {
    name = "dwmblocks";
    version = "1.0.0";
    src = ./.;

    nativeBuildInputs = [
      pkgs.libpkgconf
      pkgs.pkg-config
    ];

    buildInputs = [
      pkgs.xorg.libXinerama
      pkgs.xorg.libxcb
      pkgs.xorg.libX11
      pkgs.xorg.libXft
      pkgs.xorg.xcbutil
      pkgs.xorg.xcbutilkeysyms
      pkgs.xorg.xcbutilwm
    ];

    buildPhase = ''
      export PKG_CONFIG_PATH="${pkgs.xorg.libXinerama.dev}/lib/pkgconfig:${pkgs.xorg.libxcb.dev}/lib/pkgconfig:${pkgs.xorg.libX11.dev}/lib/pkgconfig:${pkgs.xorg.libXft.dev}/lib/pkgconfig:${pkgs.xorg.xcbutil.dev}/lib/pkgconfig:${pkgs.xorg.xcbutilkeysyms.dev}/lib/pkgconfig:${pkgs.xorg.xcbutilwm.dev}/lib/pkgconfig"
      make
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp build/dwm $out/bin/
    '';

    dontPatchELF = true;
  }

