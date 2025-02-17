{
  config,
  pkgs,
  ...
}:

{
  config = {
    services.nextcloud = {
      enable = true;

      config = {
        adminuser = "admin";
        adminpassFile = "/etc/secrets/nextcloud_admin.pw";
        dbtype = "mysql";
      };

      database.createLocally = true;

      enableImagemagick = false;

      extraApps = with config.services.nextcloud.package.packages.apps; {
        inherit calendar contacts cookbook;
      };

      extraAppsEnable = true;

      hostName = "cloud.choreutes.de";

      https = true;

      package = pkgs.nextcloud30;
    };
  };
}
