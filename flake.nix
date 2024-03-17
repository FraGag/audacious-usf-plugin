{
  description = "USF input plugin (N64) for Audacious";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, flake-utils, nixpkgs }:

    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "audacious-usf-plugin";
          src = ./.;

          buildInputs = with pkgs; [
            (audacious.override { audacious-plugins = null; })
            glib
          ];
          nativeBuildInputs = with pkgs; [
            autoconf
            automake
            gettext
            pkg-config
          ];

          preConfigure = ''
            ./autogen.sh
          '';
          # TODO: This plugin doesn't actually use GTK+.
          # This is a leftover from the audacious-plugins version it was extracted from.
          configureFlags = [ "--disable-gtk" ];

          # By default, the build system tries to install the Audacious plugin
          # under a read-only Nix store path.
          makeFlags = "plugindir=${placeholder "out"}/lib/audacious/Input";
        };
      }

    );

}
