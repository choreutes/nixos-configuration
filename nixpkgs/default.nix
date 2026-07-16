{
  lib,
  pkgs,
  pkgs-unstable,
  flake-inputs,
  ...
}:

let
  unfree-predicate = pkg: builtins.elem (lib.getName pkg) [ "cups-brother-hll2340dw" "zoom" ];

  unstable-previews-overlay = final: prev: {
    papis = pkgs-unstable.papis.override { withOptDeps = true; };
  };

  firefox-addons-overlay = final: prev: {
    firefox-addons = flake-inputs.firefox-addons.packages.${prev.stdenv.hostPlatform.system};
  };
in {
  nixpkgs = {
    config.allowUnfreePredicate = (unfree-predicate);

    overlays = [
      (firefox-addons-overlay)
      (unstable-previews-overlay)
    ];
  };
}
