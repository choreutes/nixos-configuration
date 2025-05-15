{ config, pkgs, ... }:

{
  imports = [
    ../../programs/latex
  ];

  home.packages = with pkgs; [
    libreoffice-qt6
    xournalpp
  ];
}
