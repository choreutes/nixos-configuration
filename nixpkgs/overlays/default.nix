{
  pkgs,
  pkgs-unstable,
  flake-inputs,
  ...
}:

let
  unstable-previews-overlay = final: prev: {
    papis = pkgs-unstable.papis.override { withOptDeps = true; };
  };

  firefox-addons-overlay = final: prev: {
    firefox-addons = flake-inputs.firefox-addons.packages.${prev.system};
  };
in {
  nixpkgs.overlays = [
    (firefox-addons-overlay)
    (unstable-previews-overlay)
  ];
}
