{ config, pkgs, ... }:

{
  accounts.email = {
    accounts = {
      "Privat (Hera)" = {
        address = "tobias.schmalz@choreutes.de";
        gpg.key = "FCAD 0077 F53E EF0B 1517  37FA 08F1 32C5 8232 906D";
        passwordCommand = "pass show email/hera.maralorn.de/tobias.schmalz@choreutes.de";
        realName = "Tobias Schmalz";
        userName = "tobias.schmalz@choreutes.de";

        imap = {
          host = "hera.maralorn.de";
          port = 993;
          tls.enable = true;
        };

        smtp = {
          host = "hera.maralorn.de";
          port = 465;
          tls.enable = true;
        };

        thunderbird = {
          enable = true;

          profiles = [ "choreutes" ];
        };
      };

      "Privat (Opal)" = {
        address = "tobias.schmalz@choreutes.de";
        gpg.key = "FCAD 0077 F53E EF0B 1517  37FA 08F1 32C5 8232 906D";
        passwordCommand = "pass show email/opal.choreutes.de/tobias.schmalz@choreutes.de";
        primary = true;
        realName = "Tobias Schmalz";
        userName = "tobias.schmalz@choreutes.de";

        imap = {
          host = "opal.choreutes.de";
          port = 993;
          tls.enable = true;
        };

        smtp = {
          host = "opal.choreutes.de";
          port = 465;
          tls.enable = true;
        };

        thunderbird = {
          enable = true;

          profiles = [ "choreutes" ];
        };
      };

      "TU Darmstadt" = {
        address = "tobias.schmalz@tu-darmstadt.de";
        gpg.key = "FCAD 0077 F53E EF0B 1517  37FA 08F1 32C5 8232 906D";
        passwordCommand = "pass show email/tu-darmstadt.de/zb83kexi";
        realName = "Tobias Schmalz";
        userName = "zb83kexi";

        folders = {
          inbox = "Inbox";
          drafts = "Drafts";
          sent = "Sent";
          trash = "Trash";
        };

        imap = {
          host = "mail.tu-darmstadt.de";
          port = 993;
          tls.enable = true;
        };

        smtp = {
          host = "smtp.tu-darmstadt.de";
          port = 465;
          tls.enable = true;
        };

        mbsync = {
          enable = true;
          create = "maildir";

          extraConfig = {
            account = {
              PipelineDepth = 1;
            };
          };
        };

        thunderbird = {
          enable = true;

          profiles = [ "choreutes" ];
        };
      };
    };

    maildirBasePath = "${config.xdg.dataHome}/mail";
  };

  programs = {
    mbsync.enable = true;

    thunderbird = {
      enable = true;

      profiles = {
        choreutes = {
          isDefault = true;

          accountsOrder = [ "Privat (Opal)" "Privat (Hera)" "TU Darmstadt" ];

          settings = {
            "mailnews.display.html_as" = 1;
            "mailnews.display.prefer_plaintext" = true;
            "mailnews.start_page.enabled" = false;
            "mail.default_html_action" = 1;
            "mail.html_compose" = false;
            "mail.identity.default.compose_html" = false;
            "mail.inline_attachments" = false;
            "mail.serverDefaultStoreContractID" = "@mozilla.org/msgstore/maildirstore;1";
          };

          withExternalGnupg = true;
        };
      };
    };
  };
}
