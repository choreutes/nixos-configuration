{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      awesome-vim-colorschemes
      vimtex
      vim-airline
      vim-airline-themes
      vim-colorschemes
      vim-ledger
      vim-nix
    ];
  };

  xdg.configFile."nvim" = {
    source = ./config-files;
  };
}
