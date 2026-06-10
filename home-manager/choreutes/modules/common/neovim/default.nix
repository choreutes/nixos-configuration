{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      papercolor-theme
      vimtex
      vim-airline
      vim-airline-themes
      vim-ledger
      vim-nix
    ];

    sideloadInitLua = true;

    # Disabling these is the new default starting with 26.05.
    # I am not aware of any plugins actually using these
    # so I will adopt the new default until something breaks.
    withPython3 = false;
    withRuby = false;
  };

  xdg.configFile."nvim" = {
    source = ./config-files;
  };
}
