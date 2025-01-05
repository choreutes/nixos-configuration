{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    mgba
    desmume
    citra
  ];
}
