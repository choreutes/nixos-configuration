{
  config,
  ...
}:

{
  config = {
    mailserver = {
      enable = true;

      acmeCertificateName = "www.choreutes.de";
      certificateScheme = "acme";

      domains = [ "choreutes.de" ];
      fqdn = "opal.choreutes.de";

      hierarchySeparator = "/";

      indexDir = "/var/lib/dovecot/indices";

      loginAccounts = {
        "tobias.schmalz@choreutes.de" = {
          catchAll = [ "choreutes.de" ];
          hashedPasswordFile = "/etc/nixos/configuration.d/users/choreutes/mail_password.pw";
          name = "choreutes";
        };
      };

      useFsLayout = true;

      vmailGroupName = "vmail";
      vmailUserName = "vmail";
    };
  };
}
