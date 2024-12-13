{ config, pkgs, ... }:

{
  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
  };

  i18n = {
    defaultLocale = "de_DE.UTF-8";
    supportedLocales = [
      "de_DE.UTF-8/UTF-8"
      "en_GB.UTF-8/UTF-8"
      "en_US.UTF-8/UTF-8"
    ];
  };

  services.xserver.xkb.layout = "de";

  time.timeZone = "Europe/Berlin";
}
