{
  config,
  pkgs,
  ...
}:

{
  config = {
    home.packages = with pkgs; [
      dust     # du in rust
      dysk     # df in rust
      handlr   # xdg-open in rust
      jless    # json/yaml editor
      just     # command runner similar to make
      miller   # stream editor for csv files
      rip2     # rm with graveyard in rust
      sd       # sed in rust
    ];

    programs = {
      # cat with wings in rust
      bat.enable = true;

      # top/htop in rust
      bottom.enable = true;

      # diff side-by-side in rust
      delta.enable = true;

      # syntax-aware diff in rust
      difftastic.enable = true;

      # ls in rust (1)
      eza.enable = true;

      # find in rust
      fd.enable = true;

      # ls in rust (2)
      lsd.enable = true;

      # grep in rust
      ripgrep.enable = true;

      # terminal file manager
      yazi = {
        enable = true;

        shellWrapperName = "y";
      };

      # cd on steroids
      zoxide.enable = true;
    };
  };
}
