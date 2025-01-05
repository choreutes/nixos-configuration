{ config, pkgs, ... }:

{
  imports = [
    ./neovim
    ./zsh-config

    ../../programs/gnupg
  ];

  home = {
    username = "choreutes";
    homeDirectory = "/home/choreutes";

    packages = with pkgs; [
      mtpfs
      parallel
      ranger
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;

      signing.key = "99CA7A000D9729CE!";

      userName = "Tobias Schmalz";
      userEmail = "github@choreutes.de";

      ignores = [
        "*.aux"
        "*.swp"
      ];
    };

    htop = {
      enable = true;

      settings = {
        account_guest_in_cpu_meter = false;
        color_scheme = 0;
        cpu_count_from_zero = false;
        delay = 15;
        detailed_cpu_time = false;
        enable_mouse = true;
        fields = [ 0 48 17 18 38 39 40 2 46 47 49 1 ];
        header_margin = true;

        hide_threads = false;
        hide_kernel_threads = true;
        hide_userland_threads = true;

        highlight_base_name = true;
        highlight_megabytes = true;
        highlight_threads = true;

        left_meters = [ "AllCPUs2" "Memory" "Swap" ];
        left_meter_modes = [ 1 1 1 ];
        right_meters = [ "Tasks" "Uptime" "Systemd" ];
        right_meter_modes = [ 2 2 2 ];

        shadow_other_users = false;

        show_cpu_frequency = true;
        show_cpu_usage = false;

        show_program_path = false;
        show_thread_names = false;

        tree_view = true;
        update_process_names = false;

        vim_mode = true;
      };
    };

    password-store = {
      enable = true;

      settings = {
        PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";
      };
    };
  };

  xdg = {
    enable = true;

    mimeApps.enable = true;
  };
}
