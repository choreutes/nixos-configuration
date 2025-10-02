{ config, pkgs, ... }:

{
  accounts.contact = {
    accounts."opal_carddav" = {
      khard.enable = true;

      local = {
        fileExt = ".vcf";
        type = "filesystem";
      };

      remote = {
        passwordCommand = [ "pass" "www/cloud.choreutes.de/choreutes" ];
        type = "carddav";
        url = "https://cloud.choreutes.de/remote.php/dav/addressbooks/users/choreutes/kontakte";
        userName = "${config.home.username}";
      };

      vdirsyncer = {
        enable = true;
        metadata = [ "displayname" ];
      };
    };
    basePath = "${config.xdg.dataHome}/vdirsyncer/contacts";
  };
}
