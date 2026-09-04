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

  extraFiles = {
    "lua/luasnip-utils/tex/conditions.lua".source = ./luasnip-utils/tex/conditions.lua;
  };

  files = {
    "after/ftplugin/bib.lua" = {
      localOpts = {
        expandtab = true;
        foldenable = true;
        foldmethod = "syntax";
        shiftwidth = 2;
        softtabstop = 2;
        tabstop = 2;
      };
    };

    "after/ftplugin/ledger.lua" = {
      localOpts = {
        foldenable = true;
        foldmethod = "syntax";
      };

      keymaps = [
        {
          action = ":LedgerAlign<CR>";
          key = "<LocalLeader>a";
          mode = [ "n" "v" ];
          options = {
            desc = "Align amounts in range at decimal separator";
            buffer = true;
            silent = true;
          };
        }
        {
          action = "vip :LedgerAlign<CR>";
          key = "<LocalLeader>A";
          mode = [ "n" ];
          options = {
            desc = "Align amounts in current posting at decimal separator";
            buffer = true;
            silent = true;
          };
        }
        {
          action = ":LedgerAlignBuffer<CR>";
          key = "<LocalLeader>ab";
          mode = [ "n" ];
          options = {
            desc = "Align amounts in entire buffer at decimal separator";
            buffer = true;
            silent = true;
          };
        }
      ];
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

    mapleader = "<Space>";
    maplocalleader = "\\";
  };

  keymaps = [
    {
      action = "<Nop>";
      key = "<Space>";
      mode = [ "n" "v" ];
      options = {
        desc = "Unbind spacebar to use it as mapleader";
      };
    }
  ];

  lsp = {
    servers = {
      texlab.enable = true;
      tinymist.enable = true;
    };
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
          preset = "enter";
        };
        snippets = {
          preset = "luasnip";
        };
        sources = {
          default = [ "lsp" "path" "snippets" "buffer" ];

          per_filetype = {
            ledger = [ "omni" ];
          };
        };
      };
    };
    ledger = {
      enable = true;

      settings = {
        bin = "ledger";
        accounts_cmd = "ledger accounts";
        descriptions_cmd = "ledger payees";
        date_format = "%Y-%m-%d";
        decimal_sep = ",";
      };
    };
    lualine.enable = true;
    luasnip = {
      enable = true;

      fromLua = [
        {
          paths = ./luasnip-snippets;
        }
      ];
    };
    nix.enable = true;
    vimtex = {
      enable = true;

      # Maybe these options should depend on GUI being enabled.
      mupdfPackage = null;
      texlivePackage = null;
      xdotoolPackage = null;
      zathuraPackage = null;
    };
  };
}
