{ config, pkgs, ... }:

{
  imports = [
    ../../programs/latex
    ../../programs/papis
  ];

  home.packages = with pkgs; [
    libreoffice-qt
    xournalpp
  ];
}
