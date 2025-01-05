{ config, pkgs, ... }:

{
  imports = [
    ../graphical
  ];

  home.packages = with pkgs; [
    kaddressbook
    kcalc
    kontact
    korganizer
    kmail
    plasma-nm
    syncthingtray
    wacomtablet
  ];

  services.kdeconnect.enable = true;
}
