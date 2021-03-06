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
    acpid
    git
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

    resolved.enable = true;
  };

  users.mutableUsers = false;
}
