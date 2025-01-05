{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "SauceCodePro Nerd Font";
      size = 10;
    };

    settings = {
      background_opacity = "0.8";
      enable_audio_bell = false;
    };

    themeFile = "PaperColor_dark";
  };

  # Old configuration method. Keep around for reference/backup
  #
  # home.packages = with pkgs; [
  #   kitty
  # ];

  # xdg.configFile = {
  #   "kitty/kitty.conf".source = ./kitty.conf;
  #   "kitty/colorschemes/papercolor-dark.conf".source = ./colorschemes/papercolor-dark.conf;
  #   "kitty/colorschemes/papercolor-light.conf".source = ./colorschemes/papercolor-light.conf;
  # };
}
