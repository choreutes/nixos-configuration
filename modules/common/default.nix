{
  config,
  pkgs,
  ...
}:

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
    gnumake
    tree
  ];

  hardware.enableRedistributableFirmware = true;

  # Enable flake support
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs = {
    git.enable = true;

    htop.enable = true;

    vim = {
      defaultEditor = true;
      enable = true;
    };
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
