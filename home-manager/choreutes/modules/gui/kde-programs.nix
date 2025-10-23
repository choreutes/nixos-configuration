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
      kaddressbook
      kcalc
      kclock
      kontact
      korganizer
      kmail
      plasma-nm
      wacomtablet
    ];

    services.kdeconnect = {
      enable = true;

      package = pkgs.kdePackages.kdeconnect-kde;
    };
  };
}
