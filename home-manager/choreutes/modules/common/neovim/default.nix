{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    initLua = ''
      vim.opt.number = true

      vim.opt.list = true
      vim.opt.listchars = { nbsp = '⍽', tab = '⪫ ', trail = '•' }

      -- wrap is enabled by default
      vim.opt.breakindent = true
      vim.opt.linebreak = true

      vim.opt.scrolloff = 3

      -- hlsearch is enabled by default, so I don't need it here
      vim.opt.ignorecase = true
      vim.opt.smartcase = true

      vim.opt.splitright = true
      vim.opt.splitbelow = true

      -- Setting these is apparently required for the colorscheme to persist...
      vim.opt.background = dark
      vim.opt.termguicolors = true

      vim.cmd([[colorscheme PaperColor]])
    '';

    plugins = with pkgs.vimPlugins; [
      papercolor-theme
      vim-airline-themes
      {
        plugin = vim-airline;
        config = ''
          vim.g.airline_powerline_fonts = 1
          vim.g.airline_theme = "papercolor"
        '';
        type = "lua";
      }
      {
        plugin = vimtex;
        runtime = {
          "after/ftplugin/tex.lua".text = ''
            vim.opt.expandtab = true
            vim.opt.shiftwidth = 2
            vim.opt.softtabstop = 2
          '';
        };
        type = "lua";
      }
      {
        plugin = vim-ledger;
        runtime = {
          "after/ftplugin/ledger.lua".text = ''
            vim.opt.shiftwidth = 4
            vim.opt.tabstop = 4

            vim.opt.foldenable = true
            vim.opt.foldmethod = "syntax"
          '';
        };
        type = "lua";
      }
      vim-nix
    ];

    # sideloadInitLua = true;

    # Disabling these is the new default starting with 26.05.
    # I am not aware of any plugins actually using these
    # so I will adopt the new default until something breaks.
    withPython3 = false;
    withRuby = false;
  };

  # xdg.configFile."nvim" = {
  #   source = ./config-files;
  # };
}
