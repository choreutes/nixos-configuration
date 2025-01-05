{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    khal
  ];

  xdg.configFile."khal/config".text = ''
    [default]
    default_calendar = "Privates"
    highlight_event_days = true
    print_new = event


    [calendars]

    [[Feiertage]]
    path = "${config.xdg.dataHome}/vdirsyncer/calendars/feiertage"

    [[Ferien]]
    path = "${config.xdg.dataHome}/vdirsyncer/calendars/ferien"

    [[Mathematik]]
    path = "${config.xdg.dataHome}/vdirsyncer/calendars/mathematik"

    [[Physik]]
    path = "${config.xdg.dataHome}/vdirsyncer/calendars/physik"

    [[Privates]]
    path = "${config.xdg.dataHome}/vdirsyncer/calendars/privates"

    [[Promotion]]
    path = "${config.xdg.dataHome}/vdirsyncer/calendars/promotion-ag-fischlin"

    [[TC Blau-Gold Langen]]
    path = "${config.xdg.dataHome}/vdirsyncer/calendars/tc-blau-gold-langen"

    [[TSZ Blau-Gold Casino Darmstadt]]
    path = "${config.xdg.dataHome}/vdirsyncer/calendars/tsz-blau-gold-casino-darmstadt"
  '';
}
