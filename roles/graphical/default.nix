{ config, pkgs, ... }:

{
  imports = [
    ./fonts.nix
  ];

  environment.systemPackages = with pkgs; [
    alacritty
    kitty
    razergenie
    smartmontools
  ];

  hardware = {
    firmware = with pkgs; [ sof-firmware ];

    openrazer = {
      enable = true;

      users = [ "choreutes" ];
    };
  };

  programs = {
    sway = {
      enable = true;

      extraPackages = with pkgs; [
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
    displayManager.sddm.enable = true;

    libinput.enable = true;

    printing = {
      enable = true;

      drivers = with pkgs; [
        gutenprint
        hplip
      ];
    };

    smartd.enable = true;

    xserver = {
      desktopManager.plasma5.enable = true;

      enable = true;

      wacom.enable = true;
    };
  };
}
