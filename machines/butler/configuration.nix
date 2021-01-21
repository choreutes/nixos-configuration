{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../roles/common
    ../../roles/graphical
    ../../users/choreutes
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd.luks.devices."nixos_root".device = "/dev/disk/by-uuid/2969d6e3-6322-4b62-9e27-c5f8403346dd";
  };

  # Other partitions to decrypt at boot time (contents of /etc/crypttab)
  environment.etc."crypttab".source = ./crypttab;

  # Filesystems to mount at boot time (contents of /etc/fstab)
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/eba6dcf4-b5e2-47b6-b8d2-3cd56a1e3f6b";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/eba6dcf4-b5e2-47b6-b8d2-3cd56a1e3f6b";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/3C74-8E62";
      fsType = "vfat";
    };
  };

  # Use systemd to decrypt those partitions...
  # (Now done by default, so we don't have to specify it)
  # systemd.packages = [ pkgs.systemd-cryptsetup-generator ];

  # ...and pam_mount to mount them
  security.pam.mount = {
    enable = true;

    extraVolumes = [
      "<volume pgrp=\"users\" fstype=\"btrfs\" path=\"/dev/disk/by-uuid/bf013eef-2915-42df-b4c5-fa97c6f83812\" mountpoint=\"~/Vault\" options=\"subvol=@%(USER)\" />"
      "<volume pgrp=\"users\" fstype=\"btrfs\" path=\"/dev/disk/by-uuid/bf013eef-2915-42df-b4c5-fa97c6f83812\" mountpoint=\"~/Musik\" options=\"subvol=@music\" />"
    ];
  };

  networking = {
    domain = "choreutes.de";
    hostName = "butler";

    useDHCP = false;  # Deprecated option
  };

  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = [
    "nvidia"
    "nouveau"
    "vesa"
    "modesetting"
  ];

  systemd.network = {
    enable = true;

    networks = {
      "lan-connection" = {
        enable = true;

        DHCP = "yes";

        name = "enp0s31f6";
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "19.03"; # Did you read the comment?
}
