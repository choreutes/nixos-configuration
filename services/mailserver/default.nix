{
  config,
  options,
  ...
}:

{
  config = {
    mailserver = {
      enable = true;

      accounts = {
        "tobias.schmalz@choreutes.de" = {
          catchAll = [ "choreutes.de" ];
          hashedPasswordFile = "/etc/nixos/configuration.d/users/choreutes/mail_password.pw";
          name = "choreutes";
        };
      };

      domains = [ "choreutes.de" ];
      fqdn = "opal.choreutes.de";

      hierarchySeparator = "/";

      indexDir = "/var/lib/dovecot/indices";

      mailboxes = options.mailserver.mailboxes.default // {
        Archive = {
          auto = "subscribe";
          special_use = "\\Archive";
        };
      };

      storage = {
        directoryLayout = "fs";
        group = "vmail";
        owner = "vmail";
      };

      x509.useACMEHost = "www.choreutes.de";

      stateVersion = 3;
    };
  };
}
