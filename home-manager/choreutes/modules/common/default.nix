{
  config,
  flake-inputs,
  pkgs,
  ...
}:

{
  imports = [
    flake-inputs.nixvim.homeModules.nixvim
    ./git.nix
    ./gnupg
    ./htop.nix
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

      nixvim = {
        enable = true;

        # This way of importing the config has two main advantages:
	#   1) The submodule lives inside the namespace "programs.nixvim" by default
	#      --> Shorter configuration syntax
	#   2) Nixvim injects some helper functions into the lib argument for all submodules
	#      that are imported this way.
        imports = [ ./nixvim.nix ];
      };
    };

    xdg = {
      enable = true;

      mimeApps.enable = true;

      userDirs = {
        enable = true;

        desktop = "${config.home.homeDirectory}/.Desktop";
        publicShare = "${config.home.homeDirectory}/";
        templates = "${config.home.homeDirectory}/";

        # Disables session variables like XDG_DESKTOP_DIR
        # Applications are supposed to query these
        #   1) via xdg-user-dir
        #   2) from the ${xdg.configHome}/user-dirs.dirs
        # Let's see if this works or not.
        setSessionVariables = false;
      };
    };
  };
}
