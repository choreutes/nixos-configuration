{
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

  files = {
    "after/ftplugin/ledger.lua" = {
      localOpts = {
        foldenable = true;
	foldmethod = "syntax";

	shiftwidth = 4;
	tabstop = 4;
      };
    };
  };

  opts = {
    number = true;

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
    ledger.enable = true;
    lualine.enable = true;
    nix.enable = true;
    vimtex.enable = true;
  };
}
