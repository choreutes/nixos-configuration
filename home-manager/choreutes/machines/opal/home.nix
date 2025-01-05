{ config, pkgs, ... }:

{
  imports = [
    ../../features/common
  ];

  home = {
    stateVersion = "23.05";
  };

  programs.gpg.settings = {
    no-autostart = true;
  };
}
