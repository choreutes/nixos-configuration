{
  config,
  pkgs,
  ...
}:

{
  config = {
    services = {
      mysql = {
        enable = true;

        ensureDatabases = [ "vikunja" ];
        ensureUsers = [
          {
            name = "vikunja";
            ensurePermissions = {
              "vikunja.*" = "ALL PRIVILEGES";
            };
          }
        ];
      };

      vikunja = {
        enable = true;

        database = {
          database = "vikunja";
          host = "/run/mysqld/mysqld.sock";
          type = "mysql";
          user = "vikunja";
        };

        frontendHostname = "tasks.choreutes.de";
        frontendScheme = "http";

        settings = {
          service.enableregistration = false;
        };
      };
    };
  };
}
