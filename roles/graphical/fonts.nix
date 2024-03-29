{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    dejavu_fonts
    fira
    fira-code
    fira-mono
    font-awesome
    gyre-fonts
    hack-font
    liberation_ttf
    libertine
    lmmath
    lmodern
    (nerdfonts.override { fonts = [ "FiraCode" "FiraMono" "Meslo" "SourceCodePro" ]; })
    noto-fonts
    roboto
    source-code-pro
    source-sans-pro
    source-serif-pro
    stix-otf
  ];
}
