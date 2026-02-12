{
  config,
  pkgs,
  ...
}:

{
  config = {
    services.vikunja = {
      enable = true;

      database = {
        host = "localhost";
        type = "sqlite";
      };

      frontendHostname = "tasks.choreutes.de";
      frontendScheme = "http";
    };
  };
}
