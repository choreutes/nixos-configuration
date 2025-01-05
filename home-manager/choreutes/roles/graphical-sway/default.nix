{ config, pkgs, ... }:

{
  imports = [
    ../graphical
  ];

  home = {
    packages = with pkgs; [
      qt5ct
    ];

    sessionVariables = {
      QT_QPA_PLATFORMTHEME = "qt5ct";
    };
  };

  programs.firefox.package = pkgs.firefox-wayland;

  xdg = {
    configFile = {
      "sway/config".source = ../../dotfiles/sway/config;
      "waybar/config".source = ../../dotfiles/waybar/config;
      "waybar/style.css".source = ../../dotfiles/waybar/style.css;
    };

    dataFile = {
      "icons/default/index.theme".text = ''
        [Icon Theme]
        Inherits = breeze_cursors
      '';
    };
  };
}
