{ config, pkgs, firefox-addons, ... }:

{
  imports = [
    ../../roles/personal

    ../../modules/common
    ../../modules/cryptoplexity
    ../../modules/gui
    ../../modules/productivity
  ];

  home = {
    stateVersion = "25.11";
  };

  xdg.userDirs = {
    documents = "${config.home.homeDirectory}/Dokumente";
    music = "${config.home.homeDirectory}/Musik";
    pictures = "${config.home.homeDirectory}/Bilder";
  };

  host-specific = {
    cryptoplexity.enable = true;

    gui = {
      enable = true;

      kde-programs.enable = true;
    };

    ledger = {
      file = "${config.home.homeDirectory}/Finanzen/main.ledger";
      pricedb = "${config.home.homeDirectory}/Finanzen/.pricedb.ledger";
    };

    productivity.document-management.papis = {
      research-dir = "${config.home.homeDirectory}/Library/Research";
      textbook-dir = "${config.home.homeDirectory}/Library/Textbooks";
    };
  };
}
