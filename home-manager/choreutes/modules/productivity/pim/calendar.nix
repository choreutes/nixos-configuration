{
  config,
  lib,
  ...
}:

let
  cfg = config.host-specific.productivity.pim;

  basePath = "${config.xdg.dataHome}/vdirsyncer/calendars";

  cloudCalendarConfig = { name, color, primary ? false, readonly ? false }: {
    khal = {
      enable = true;

      inherit color;
    };

    local = {
      fileExt = ".ics";
      path = "${basePath}/opal/${name}";
      type = "filesystem";
    };

    inherit primary;

    remote = {
      passwordCommand = [ "pass" "www/cloud.choreutes.de/choreutes" ];
      type = "caldav";
      url = "https://cloud.choreutes.de/remote.php/dav/calendars/choreutes/${name}";
      userName = "${config.home.username}";
    };

    thunderbird = {
      enable = true;

      inherit color;
      profiles = [ "choreutes" ];
    };

    vdirsyncer = {
      enable = true;
      metadata = [ "color" "displayname" ];
    };
  };
in
{
  config = lib.mkIf cfg.enable {
    accounts.calendar = {
      accounts = {
        "Privat" = cloudCalendarConfig {
          name = "privat";
          color = "#29cc29"; # HSB(120,80,80)
          primary = true;
        };
        "Abfall" = cloudCalendarConfig {
          name = "abfall";
          color = "#804d19";
        };
        "AG Fischlin" = cloudCalendarConfig {
          name = "ag-fischlin";
          color = "#ff9f40"; # HSB(30,75,100)
        };
        "Ehrenamt" = cloudCalendarConfig {
          name = "ehrenamt";
          color = "#1a801a"; # HSB(120,80,50)
        };
        "Formation" = cloudCalendarConfig {
          name = "formation";
          color = "#024892";
        };
        "Paarturniertanz" = cloudCalendarConfig {
          name = "paarturniertanz";
          color = "#009999"; # HSB(180,100,60)
        };
        "Mathematikstudium" = cloudCalendarConfig {
          name = "mathematikstudium";
          color = "#e6bc17"; # HSB(48,90,90)
        };
        "Physikstudium" = cloudCalendarConfig {
          name = "physikstudium";
          color = "#e6e617"; # HSB(60,90,90)
        };
        "TC Blau-Gold Langen" = cloudCalendarConfig {
          name = "tc-blau-gold-langen";
          color = "#5cc9ff";
        };
        "TSZ BGC Darmstadt" = cloudCalendarConfig {
          name = "tsz-bgc-darmstadt";
          color = "#875bff";
        };
      };

      inherit basePath;
    };
  };
}
