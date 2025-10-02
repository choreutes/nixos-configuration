{ config, pkgs, ... }:

{
  accounts.calendar = {
    accounts."opal_caldav" = {
      khal = {
        enable = true;
        type = "discover";
      };

      local = {
        fileExt = ".ics";
        type = "filesystem";
      };

      primary = true;
      primaryCollection = "Privat";

      remote = {
        passwordCommand = [ "pass" "www/cloud.choreutes.de/choreutes" ];
        type = "caldav";
        url = "https://cloud.choreutes.de/remote.php/dav/calendars/choreutes";
        userName = "${config.home.username}";
      };

      vdirsyncer = {
        enable = true;
        collections = [
          "abfall"
          "ag-fischlin"
          "mathematikstudium" 
          "physikstudium"
          "privat"
          "tc-blau-gold-langen"
          "tsz-bgc-darmstadt"
        ];
        metadata = [ "color" "displayname" ];
      };
    };
    basePath = "${config.xdg.dataHome}/vdirsyncer/calendars";
  };
}
