{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;
}
