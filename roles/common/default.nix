{ config, pkgs, ... }:

{
  imports = [
    ./localisation.nix
    ../../services/zsh.nix
  ];

  boot = {
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

  services = {
    openssh.enable = true;

    resolved.enable = true;
  };

  users.mutableUsers = false;
}
