{ config, pkgs, ... }:

{
  imports = [
    ./localisation.nix
    ../../services/zsh.nix
  ];

  boot = {
    initrd.supportedFilesystems = [ "btrfs" ];

    supportedFilesystems = [ "btrfs" "ntfs" ];

    tmpOnTmpfs = true;
  };

  environment.systemPackages = with pkgs; [
    git
    htop
    tree
    vim
  ];

  hardware.enableRedistributableFirmware = true;

  programs = {
    vim.defaultEditor = true;
  };

  services.resolved.enable = true;

  users.mutableUsers = false;
}
