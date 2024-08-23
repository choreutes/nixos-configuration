{ config, pkgs, ... }:

{
  imports = [
    ./localisation.nix
    ./zsh.nix
  ];

  boot = {
    initrd.supportedFilesystems = [ "btrfs" ];

    supportedFilesystems = [ "btrfs" "ntfs" ];

    tmp.useTmpfs = true;
  };

  environment.systemPackages = with pkgs; [
    acpid
    git
    gnumake
    htop
    tree
    vim
  ];

  hardware.enableRedistributableFirmware = true;

  programs = {
    vim.defaultEditor = true;
  };

  services = {
    acpid.enable = true;

    avahi.enable = true;

    fwupd.enable = true;

    resolved.enable = true;
  };

  systemd.extraConfig  = ''
    DefaultTimeoutStopSec=30s
  '';

  users.mutableUsers = false;

  virtualisation.podman.enable = true;
}
