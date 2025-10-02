{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./network-configuration.nix
    ../../modules/common
    ../../roles/headless
    ../../services/mailserver
    ../../services/webserver
    ../../users/choreutes
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    #kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    domain = "choreutes.de";
    hostName = "opal";

    useDHCP = false;  # Deprecated option
  };

  services = {
    qemuGuest.enable = true;

    syncthing = {
      enable = true;

      openDefaultPorts = true;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
