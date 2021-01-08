{ config, pkgs, ... }:

{
  fonts.fonts = with pkgs; [
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
    noto-fonts
    roboto
    source-code-pro
    source-sans-pro
    source-serif-pro
    stix-otf
  ];
}
