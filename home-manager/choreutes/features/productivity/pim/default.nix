{ config, pkgs, ... }:

{
  imports = [
    ./calendar.nix
    ./contacts.nix
    ./taskwarrior.nix
  ];

  programs = {
    khal.enable = true;
    khard.enable = true;
    vdirsyncer.enable = true;
  };
}
