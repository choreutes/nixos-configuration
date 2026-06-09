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
  };

  xdg.configFile."nvim" = {
    source = ./config-files;
  };
}
