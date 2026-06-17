{
  lib,
  ...
}:

{ # This file is imported as a nixvim submodule, so I don't need the "programs.nixvim" prefix.
  colorschemes = {
    github-theme = {
      enable = true;

      settings = {
        options = {
          transparent = true;
        };
      };
    };
  };

  diagnostic.settings = {
    signs = {
      text = {
        "__rawKey__vim.diagnostic.severity.ERROR" = "";
        "__rawKey__vim.diagnostic.severity.WARN" = "󱈸";
        "__rawKey__vim.diagnostic.severity.INFO" = "";
        "__rawKey__vim.diagnostic.severity.HINT" = "";
      };
    };

    update_in_insert = false;
  };

  files = {
    "after/ftplugin/ledger.lua" = {
      localOpts = {
        foldenable = true;
        foldmethod = "syntax";
      };
    };

    "after/ftplugin/tex.lua" = {
      localOpts = {
        expandtab = true;
        shiftwidth = 2;
        softtabstop = 2;
        tabstop = 2;
      };
    };
  };

  globals = {
    have_nerd_font = true;
  };

  opts = {
    number = true;

    signcolumn = "yes";

    expandtab = true;
    shiftwidth = 4;
    softtabstop = 4;
    tabstop = 4;

    list = true;
    listchars = {
      nbsp = "⍽";
      tab = "⪫ ";
      trail = "•";
    };

    wrap = true;
    breakindent = true;
    linebreak = true;

    ignorecase = true;
    smartcase = true;

    splitbelow = true;
    splitright = true;

    background = "dark";
    termguicolors = true;
  };

  plugins = {
    blink-cmp = {
      enable = true;

      settings = {
        keymap = {
          preset = "default";
        };
        snippets = {
          preset = "luasnip";
        };
        sources = {
          default = [ "lsp" "path" "snippets" "buffer" ];
        };
      };
    };
    ledger.enable = true;
    lsp = {
      enable = true;
      servers = {
        texlab.enable = true;
      };
    };
    lualine.enable = true;
    luasnip.enable = true;
    nix.enable = true;
    vimtex.enable = true;
  };
}
