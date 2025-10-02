{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common
    ../../modules/gui
    ../../roles/mobile
    ../../users/choreutes
  ];

  boot = {
    kernelModules = [
      "amd_pstate"
      "amd_pstate_ut"
    ];

    kernelParams = [
      "amd_pstate=guided"
    ];

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    #kernelPackages = pkgs.linuxPackages_latest;
  };

  hardware.amdgpu = {
    amdvlk.enable = true;

    initrd.enable = true;

    opencl.enable = true;
  };

  networking = {
    domain = "choreutes.de";
    hostName = "artemis";

    useDHCP = false;  # Deprecated option
  };

  services.xserver.videoDrivers = [
    "amdgpu"
    "vesa"
    "modesetting"
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
