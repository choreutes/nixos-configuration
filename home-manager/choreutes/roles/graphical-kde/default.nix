{ config, pkgs, ... }:

{
  imports = [
    ../graphical
  ];

  home.packages = with pkgs.kdePackages; [
    kaddressbook
    kcalc
    kclock
    kontact
    korganizer
    kmail
    plasma-nm
    wacomtablet
  ];

  services.kdeconnect = {
    enable = true;

    package = pkgs.kdePackages.kdeconnect-kde;
  };
}
