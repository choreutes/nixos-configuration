{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  flake-inputs,
  ...
}:

let
  unfree-predicate = pkg: builtins.elem (lib.getName pkg) [ "cups-brother-hll2340dw" "zoom" "steam-unwrapped" ];

  unstable-previews-overlay = final: prev: {
    concord-tui = pkgs-unstable.concord-tui;
    papis = pkgs-unstable.papis.override { withOptDeps = true; };
  };

  firefox-addons-overlay = final: prev: {
    firefox-addons = flake-inputs.firefox-addons.packages.${prev.stdenv.hostPlatform.system};
  };
in
  {
    config = {
      nixpkgs = {
        config.allowUnfreePredicate = (unfree-predicate);

        overlays = [
          (firefox-addons-overlay)
          (unstable-previews-overlay)
        ];
      };
    };
  }
