{ config, pkgs, firefox-addons, ... }:

{
  imports = [
    ../../roles/office
    ../../roles/personal
    ../../roles/work

    ../../modules/common
    ../../modules/gui
    ../../modules/productivity
  ];

  home = {
    stateVersion = "23.05";
  };

  host-specific = {
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
