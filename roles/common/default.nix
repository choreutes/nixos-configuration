{ config, pkgs, ... }:

{

  imports = [
    ./localisation.nix
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
    zsh = {
      enable = true;

      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      ohMyZsh.enable = true;
    };
  };

  services = {
    resolved.enable = true;
  };

  time.timeZone = "Europe/Berlin";

}

