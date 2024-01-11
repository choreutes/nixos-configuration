{ config, pkgs, ... }:

{
  services.nginx = {
    enable = true;

    logError = "stderr warn";

    virtualHosts = {
      "www.choreutes.de" = {
        acmeRoot = "/var/lib/acme/challenges/www.choreutes.de";
        forceSSL = true;
        locations."/" = {
          index = "index.html";
        };
        root = "/srv/www/www.choreutes.de";
        useACMEHost = "www.choreutes.de";
      };

      "cloud.choreutes.de" = {
        acmeRoot = "/var/lib/acme/challenges/www.choreutes.de";
        forceSSL = true;
        useACMEHost = "www.choreutes.de";
      };
    };
  };

  users.users.nginx.extraGroups = [ "acme" ];
}
