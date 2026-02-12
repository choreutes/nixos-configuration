{
  config,
  pkgs,
  ...
}:

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
    desktopManager.plasma6 = {
      enable = true;

      enableQt5Integration = false;
    };

    displayManager.sddm = {
      enable = true;

      wayland = {
        enable = true;
        compositor = "kwin";
      };
    };

    libinput.enable = true;

    # Smartcard daemon (required for Yubico Authenticator to work)
    pcscd.enable = true;

    printing = {
      enable = true;

      drivers = with pkgs; [
        gutenprint
        hplip
        cups-brother-hll2340dw
      ];
    };

    smartd.enable = true;

    xserver = {
      enable = true;

      wacom.enable = true;
    };
  };
}
