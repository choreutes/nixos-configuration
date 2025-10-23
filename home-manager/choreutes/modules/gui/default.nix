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
      ];

      sessionVariables = {
        BROWSER = "firefox";
        TERMINAL = "kitty";
      };
    };

    programs = {
      firefox = {
        enable = true;

        profiles.choreutes = {
          extensions = {
            packages = with pkgs.firefox-addons; [
              ublock-origin
            ];
          };
        };
      };

      kitty = {
        enable = true;

        font = {
          name = "SauceCodePro Nerd Font";
          size = 10;
        };

        settings = {
          background_opacity = "0.8";
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

        matchBlocks = {
          "opal.choreutes.de" = {
            forwardAgent = true;

            remoteForwards = [
              {
                bind.address = "/run/user/1000/gnupg/S.gpg-agent";
                host.address = "/run/user/1000/gnupg/S.gpg-agent.extra";
              }
            ];
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

      syncthing.enable = true;
    };
  };
}
