{ config, pkgs, ... }:

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
    sessionVariables = {
      LEDGER_HOME = "${config.home.homeDirectory}/Finanzen";
    };

    stateVersion = "23.05";
  };

}
