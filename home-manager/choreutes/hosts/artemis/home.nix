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
    stateVersion = "23.05";
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

    papis = {
      library-dir = "${config.home.homeDirectory}/Library";
    };
  };
}
