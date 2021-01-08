{ config, pkgs, ... }:

{
  imports = [
    ./fonts.nix
  ];

  hardware.pulseaudio.enable = true;

  programs = {
    qt5ct.enable = true;

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

    waybar.enable = true;
  };

  services = {
    printing.enable = true;

    xserver = {
      desktopManager.plasma5.enable = true;
      displayManager.sddm.enable = true;

      enable = true;

      libinput.enable = true;
    };
  };

  sound.enable = true;
}
