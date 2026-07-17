{
  config,
  ...
}:

{
  config = {
    security.acme = {
      acceptTerms = true;
      certs = {
        "www.choreutes.de" = {
          extraDomainNames = [
            "blog.choreutes.de"
            "cloud.choreutes.de"
            "opal.choreutes.de"
          ];
          group = "nginx";
          webroot = "/var/lib/acme/challenges/www.choreutes.de";
        };
      };
      defaults = {
        email = "letsencrypt@choreutes.de";
      };
    };
  };
}
