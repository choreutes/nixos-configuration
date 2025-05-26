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
    # (nerdfonts.override { fonts = [ "FiraCode" "FiraMono" "Meslo" "SourceCodePro" ]; })
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.meslo-lg
    nerd-fonts.sauce-code-pro
    noto-fonts
    roboto
    source-code-pro
    source-sans-pro
    source-serif-pro
    stix-otf
  ];
}
