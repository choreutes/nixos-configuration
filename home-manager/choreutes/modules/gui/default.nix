{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.host-specific.gui;
in
{
  imports = [
    ./kde-programs.nix
  ];

  options = with lib; {
    host-specific.gui.enable = mkEnableOption "GUI programs";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        mpv
        qpdfview
        yubioath-flutter
      ];

      sessionVariables = {
        BROWSER = "firefox";
        TERMINAL = "kitty";
      };
    };

    programs = {
      browserpass = {
        enable = true;

        browsers = [ "firefox" ];
      };

      firefox = {
        enable = true;

        # Firefox now also supports XDG base directory specification (instead of ``.mozilla/firefox``).
        # However, for now this only encompasses .mozilla/firefox and not native messaging hosts.
        # For now I will keep the legacy path until I can entirely remove the ``.mozilla`` directory.
        configPath = ".mozilla/firefox";

        languagePacks = [ "de" "en-US" ];

        nativeMessagingHosts = with pkgs; [
          kdePackages.plasma-browser-integration
        ];

        profiles.choreutes = {
          extensions = {
            packages = with pkgs.firefox-addons; [
              browserpass
              plasma-integration
              ublock-origin
            ];
          };
        };
      };

      kitty = {
        enable = true;

        font = {
          name = "SauceCodePro Nerd Font";
          size = 14;
        };

        settings = {
          background_opacity = "0.8";
          cursor_trail = "5";
          cursor_trail_decay = "0.3 0.5";
          enable_audio_bell = false;
        };

        themeFile = "PaperColor_dark";
      };

      qutebrowser = {
        enable = true;

        settings = {
          colors.tabs = {
            selected = {
              even = {
                bg = "#eff0f1";
                fg = "#232627";
              };
              odd = {
                bg = "#eff0f1";
                fg = "#232627";
              };
            };
          };

          content.default_encoding = "utf-8";

          downloads.position = "bottom";

          scrolling = {
            smooth = true;
          };

          tabs.show = "multiple";
        };
      };

      ssh = {
        enable = true;
        enableDefaultConfig = false;

        settings = {
          "opal.choreutes.de" = {
            ForwardAgent = true;

            RemoteForward = {
              bind.address = "/run/user/1000/gnupg/S.gpg-agent";
              host.address = "/run/user/1000/gnupg/S.gpg-agent.extra";
            };
          };

          # These are the default values for ssh host blocks.
          # I'm keeping them around for now...
          "*" = {
            AddKeysToAgent = "no";
            Compression = false;
            ControlMaster = "no";
            ControlPath = "~/.ssh/master-%r@%n:%p";
            ControlPersist = "no";
            ForwardAgent = false;
            HashKnownHosts = false;
            ServerAliveCountMax = 3;
            ServerAliveInterval = 0;
            UserKnownHostsFile = "~/.ssh/known_hosts";
          };
        };
      };
    };

    services = {
      gpg-agent = {
        enable = true;

        enableExtraSocket = true;
        enableSshSupport = true;

        pinentry = {
          package = pkgs.pinentry-qt;
        };

        sshKeys = [ "178D43591E8A412D0AA5098567E5AEF509BB3C0A" ];
      };

      nextcloud-client = {
        enable = true;
      };
    };
  };
}
