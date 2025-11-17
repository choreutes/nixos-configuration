{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./git.nix
    ./gnupg
    ./htop.nix
    ./neovim
    ./pass.nix
    ./zsh-config
  ];

  config = {
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
    };

    xdg = {
      enable = true;

      mimeApps.enable = true;

      userDirs = {
        enable = true;

        desktop = "${config.home.homeDirectory}/.Desktop";
        publicShare = "${config.home.homeDirectory}/";
        templates = "${config.home.homeDirectory}/";
      };
    };
  };
}
