{
  config,
  pkgs,
  ...
}:

{
  config = {
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

    services.xserver.xkb = {
      model = "pc105";
      layout = "de";
      variant = "e1";
      options = "lv3:caps_switch_capslock_with_ctrl";
    };

    time.timeZone = "Europe/Berlin";
  };
}
