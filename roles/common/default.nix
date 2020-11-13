{ config, pkgs, ... }:

{

  boot = {
    supportedFilesystems = [ "btrfs" "ntfs" ];

    tmpOnTmpfs = true;
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
  };

  environment.systemPackages = with pkgs; [
    git
    htop
    tree
    vim
  ];

  i18n = {
    defaultLocale = "de_DE.UTF-8";
    supportedLocales = [
      "de_DE.UTF-8/UTF-8"
      "en_GB.UTF-8/UTF-8"
      "en_US.UTF-8/UTF-8"
    ];
  };

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

