{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    calibre
  ];

  imports = [
    ../../programs/ledger
  ];
}
