{ config, pkgs, ... }:

{
  imports = [
    <nixos-hardware/lenovo/thinkpad/t14s/amd/gen1>
    ./hardware-configuration.nix
    ../../roles/common
    ../../roles/graphical
    ../../roles/mobile
    ../../users/choreutes
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    #kernelPackages = pkgs.linuxPackages_latest;
  };

  hardware.opengl = {
    driSupport = true;

    enable = true;

    extraPackages = with pkgs; [
      amdvlk
      rocm-opencl-icd
      rocm-opencl-runtime
    ];
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
