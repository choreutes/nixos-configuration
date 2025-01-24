{ config, pkgs, firefox-addons, ... }:

{
  imports = [
    ../../roles/graphical-kde
    ../../roles/office
    ../../roles/personal
    ../../roles/work

    ../../features/common
    ../../features/productivity
  ];

  home = {
    stateVersion = "23.05";
  };

  host-specific = {
    ledger = {
      file = "${config.home.homeDirectory}/Finanzen/main.ledger";
      pricedb = "${config.home.homeDirectory}/Finanzen/.pricedb.ledger";
    };
  };
}
