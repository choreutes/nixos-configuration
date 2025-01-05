{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    vdirsyncer
  ];

  xdg.configFile."vdirsyncer/config".text = ''
    [general]
    status_path = "${config.xdg.dataHome}/vdirsyncer/status/"

    [storage local_calendars]
    type = "filesystem"
    path = "${config.xdg.dataHome}/vdirsyncer/calendars/"
    fileext = ".ics"

    [storage hera_calendars]
    type = "caldav"
    url = "https://cloud.maralorn.de/remote.php/dav/calendars/choreutes/"
    username = "choreutes"
    password.fetch = [ "prompt", "Password for Hera CalDAV" ]

    [pair hera_caldav]
    a = "hera_calendars"
    b = "local_calendars"
    collections = [ "feiertage", "ferien", "mathematik", "physik", "privates", "promotion-ag-fischlin", "tc-blau-gold-langen", "tsz-blau-gold-casino-darmstadt" ]
    conflict_resolution = [ "command", "nvim", "-d" ]
    metadata = [ "color", "displayname" ]
  '';
}
