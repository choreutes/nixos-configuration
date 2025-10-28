{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.host-specific.gui;
in
{
  options = with lib; {
    host-specific.gui.kde-programs.enable = mkEnableOption "KDE applications";
  };

  config = lib.mkIf cfg.kde-programs.enable {
    home.packages = with pkgs.kdePackages; [
      ghostwriter   # markdown editor/previewer
      kaddressbook  # address book
      kcalc         # calculator
      kclock        # (alarm) clock
      kmines        # minesweeper
      kontact       # KDE PIM
      korganizer    # calendar
      kmail         # e-mail client
      kpat          # card game
      ksudoku       # sudoku
      plasma-nm     # NetworkManager applet
      wacomtablet   # KDE settings for touch screens
    ];

    services.kdeconnect = {
      enable = true;

      package = pkgs.kdePackages.kdeconnect-kde;
    };
  };
}
