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
          host = "localhost";
          type = "sqlite";
        };

        frontendHostname = "tasks.choreutes.de";
        frontendScheme = "http";
      };
    };
  };
}
