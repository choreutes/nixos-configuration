{ config, pkgs, ... }:

{
  environment.pathsToLink = [ "/share/zsh" ];

  programs.zsh = {
    enable = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;
}
