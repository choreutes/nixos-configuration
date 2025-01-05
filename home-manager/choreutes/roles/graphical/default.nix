{ config, pkgs, ... }:

{
  imports = [
    ../../programs/kitty
    ../../services/gnupg
  ];

  home = {
    packages = with pkgs; [
      cmst
      libwacom
      lxqt.lximage-qt
      lxqt.pavucontrol-qt
      lxqt.pcmanfm-qt
      mpv
      qpdfview
    ];

    sessionVariables = {
      BROWSER = "firefox";
      TERMINAL = "kitty";
    };
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
    firefox = {
      enable = true;

      profiles.choreutes = {
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
        ];
      };
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
  };

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  services.syncthing.enable = true;

  xdg.mimeApps = {
    associations.added = {
      "inode/directory" = "org.kde.dolphin.desktop";
      "text/x-tex" = "nvim.desktop";
    };

    defaultApplications = {
      "application/pdf" = "org.kde.okular.desktop qpdfview.desktop";
      "application/x-yaml" = "nvim.desktop";
      "inode/directory" = "org.kde.dolphin.desktop";
      "text/x-tex" = "nvim.desktop";
    };
  };
}
