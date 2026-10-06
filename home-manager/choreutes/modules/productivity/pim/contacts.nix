{
  config,
  lib,
  ...
}:

let
  cfg = config.host-specific.productivity.pim;

  basePath = "${config.xdg.dataHome}/vdirsyncer/contacts";
in
{
  config = lib.mkIf cfg.enable {
    accounts.contact = {
      accounts."Kontakte" = {
        khard.enable = true;

        local = {
          fileExt = ".vcf";
          path = "${basePath}/opal/kontakte";
          type = "filesystem";
        };

        remote = {
          passwordCommand = [ "pass" "www/cloud.choreutes.de/choreutes" ];
          type = "carddav";
          url = "https://cloud.choreutes.de/remote.php/dav/addressbooks/users/choreutes/kontakte";
          userName = "${config.home.username}";
        };

        thunderbird = {
          enable = true;

          profiles = [ "choreutes" ];
        };

        vdirsyncer = {
          enable = true;
          metadata = [ "displayname" ];
          useVcard4 = true;
        };
      };

      inherit basePath;
    };
  };
}
