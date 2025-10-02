{ config, pkgs, ... }:

{
  imports = [
    ../../modules/common
  ];

  home = {
    stateVersion = "23.05";
  };

  programs.gpg.settings = {
    no-autostart = true;
  };
}
