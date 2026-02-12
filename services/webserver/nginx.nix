{
  config,
  ...
}:

{
  config = {
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

        "tasks.choreutes.de" = {
          enableACME = true;
          forceSSL = true;
          locations."/" = {
            extraConfig = ''
              client_max_body_size  5000M;
              proxy_read_timeout     600s;
              proxy_send_timeout     600s;
              send_timeout           600s;
              '';
            proxyPass = "http://[::1]:3456";
            proxyWebsockets = true;
            recommendedProxySettings = true;
          };
        };
      };
    };
  };
}
