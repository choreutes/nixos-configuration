{ config, pkgs, ... }:

{
  programs.taskwarrior = {
    enable = true;

    extraConfig = ''
      include ${config.xdg.configHome}/task/taskserver/taskserverrc
      '';
  };
}
