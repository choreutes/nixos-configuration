{ config, pkgs, ... }:

{
  imports = [
    ./fonts.nix
  ];

  environment.systemPackages = with pkgs; [
    qt5ct
  ];

  hardware = {
    firmware = with pkgs; [ sof-firmware ];

    pulseaudio.enable = true;
  };

  nixpkgs.config.pulseaudio = true;

  programs = {
    sway = {
      enable = true;

      extraPackages = with pkgs; [
        alacritty
        kitty
        swayidle
        swaylock
        xwayland
        waybar
        wofi
      ];
    };

    # waybar.enable = true;
  };

  services = {
    printing = {
      enable = true;

      drivers = with pkgs; [
        gutenprint
        hplip
      ];
    };

    xserver = {
      desktopManager.plasma5.enable = true;
      displayManager.sddm.enable = true;

      enable = true;

      libinput.enable = true;

      wacom.enable = true;
    };
  };

  sound.enable = true;
}
