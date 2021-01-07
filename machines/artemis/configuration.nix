{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../roles/common
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  hardware.pulseaudio.enable = true;

  networking = {
    domain = "choreutes.de";
    hostName = "artemis";

    useDHCP = false;  # Deprecated option

    wireless = {
      enable = true;

      userControlled = {
        enable = true;
        group = "network";
      };
    };
  };

  sound.enable = true;

  environment = {
    etc = {
      "iwd/main.conf".text = ''
        [General]
        EnableNetworkConfiguration=true
        '';
      "ssl/certs/T-TeleSec_GlobalRoot_Class_2.pem".text = ''
        -----BEGIN CERTIFICATE-----
        MIIDwzCCAqugAwIBAgIBATANBgkqhkiG9w0BAQsFADCBgjELMAkGA1UEBhMCREUx
        KzApBgNVBAoMIlQtU3lzdGVtcyBFbnRlcnByaXNlIFNlcnZpY2VzIEdtYkgxHzAd
        BgNVBAsMFlQtU3lzdGVtcyBUcnVzdCBDZW50ZXIxJTAjBgNVBAMMHFQtVGVsZVNl
        YyBHbG9iYWxSb290IENsYXNzIDIwHhcNMDgxMDAxMTA0MDE0WhcNMzMxMDAxMjM1
        OTU5WjCBgjELMAkGA1UEBhMCREUxKzApBgNVBAoMIlQtU3lzdGVtcyBFbnRlcnBy
        aXNlIFNlcnZpY2VzIEdtYkgxHzAdBgNVBAsMFlQtU3lzdGVtcyBUcnVzdCBDZW50
        ZXIxJTAjBgNVBAMMHFQtVGVsZVNlYyBHbG9iYWxSb290IENsYXNzIDIwggEiMA0G
        CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCqX9obX+hzkeXaXPSi5kfl82hVYAUd
        AqSzm1nzHoqvNK38DcLZSBnuaY/JIPwhqgcZ7bBcrGXHX+0CfHt8LRvWurmAwhiC
        FoT6ZrAIxlQjgeTNuUk/9k9uN0goOA/FvudocP05l03Sx5iRUKrERLMjfTlH6VJi
        1hKTXrcxlkIF+3anHqP1wvzpesVsqXFP6st4vGCvx9702cu+fjOlbpSD8DT6Iavq
        jnKgP6TeMFvvhk1qlVtDRKgQFRzlAVfFmPHmBiiRqiDFt1MmUUOyCxGVWOHAD3bZ
        wI18gfNycJ5v/hqO2V81xrJvNHy+SE/iWjnX2J14np+GPgNeGYtEotXHAgMBAAGj
        QjBAMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEGMB0GA1UdDgQWBBS/
        WSA2AHmgoCJrjNXyYdK4LMuCSjANBgkqhkiG9w0BAQsFAAOCAQEAMQOiYQsfdOhy
        NsZt+U2e+iKo4YFWz827n+qrkRk4r6p8FU3ztqONpfSO9kSpp+ghla0+AGIWiPAC
        uvxhI+YzmzB6azZie60EI4RYZeLbK4rnJVM3YlNfvNoBYimipidx5joifsFvHZVw
        IEoHNN/q/xWA5brXethbdXwFeilHfkCoMRN3zUA7tFFHei4R40cR3p1m0IvVVGb6
        g1XqfMIpiRvpb7PO4gWEyS8+eIVibslfwXhjdFjASBgMmTnrpMwatXlajRWc2BQN
        9noHV8cigwUtPJslJj0Ys6lDfMjIq2SPDqO/nBudMNva0Bkuqjzx+zOAduTNrRlP
        BSeOE6Fuwg==
        -----END CERTIFICATE-----
        '';
    };
  };

  fonts.fonts = with pkgs; [
    dejavu_fonts
    fira
    fira-code
    fira-mono
    font-awesome
    gyre-fonts
    hack-font
    liberation_ttf
    libertine
    lmmath
    lmodern
    noto-fonts
    roboto
    source-code-pro
    source-sans-pro
    source-serif-pro
    stix-otf
  ];

  programs = {
    fish.enable = true;

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

    vim.defaultEditor = true;

    waybar.enable = true;
  };

  services = {
    connman.enable = true;

    openssh.enable = true;

    printing.enable = true;

    xserver = {
      desktopManager.plasma5.enable = true;
      displayManager.sddm.enable = true;

      enable = true;

      layout = "de";

      libinput.enable = true;
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;

    groups = {
      network = { };
    };

    mutableUsers = false;

    users = {
      choreutes = {
        isNormalUser = true;

        group = "users";
        extraGroups = [ "wheel" "network" ];

        passwordFile = "/etc/nixos/configuration.d/user_passwords/choreutes_artemis_cryptoplexity.pw";

        packages = with pkgs; [
          home-manager
        ];

        useDefaultShell = true;
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}

