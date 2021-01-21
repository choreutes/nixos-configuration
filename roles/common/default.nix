{ config, pkgs, ... }:

{
  imports = [
    ./localisation.nix
    ../../services/zsh.nix
  ];

  boot = {
    initrd.supportedFilesystems = [ "btrfs" ];

    kernelPackages = pkgs.linuxPackages_latest;

    supportedFilesystems = [ "btrfs" "ntfs" ];

    tmpOnTmpfs = true;
  };

  environment.systemPackages = with pkgs; [
    git
    htop
    tree
    vim
  ];

  programs = {
    vim.defaultEditor = true;
  };

  services.resolved.enable = true;

  users.mutableUsers = false;
}
