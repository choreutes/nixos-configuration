{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./fonts.nix
  ];

  config = {
    boot = {
      kernelParams = [ "quiet" "splash" ];

      plymouth = {
        enable = true;
      };
    };

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

    networking = {
      networkmanager = {
        enable = true;

        plugins = with pkgs; [
          networkmanager-openconnect
          networkmanager-openvpn
        ];

        wifi.backend = "iwd";
      };
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
    };
  };
}
