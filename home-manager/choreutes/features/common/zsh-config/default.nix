{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh-powerlevel10k
  ];

  programs.zsh = {
    enable = true;

    dotDir = ".config/zsh";

    initExtra = ''
      if zmodload zsh/terminfo && (( terminfo[colors] >=256 )); then
        [[ ! -f ${config.xdg.configHome}/zsh/.p10k.zsh ]] || source ${config.xdg.configHome}/zsh/.p10k.zsh
      else
        [[ ! -f ${config.xdg.configHome}/zsh/.p10k-portable.zsh ]] || source ${config.xdg.configHome}/zsh/.p10k-fallback.zsh
      fi
      '';

    history = {
      path = "${config.xdg.dataHome}/zsh/zsh_history";
    };

    plugins = with pkgs; [
      {
        file = "powerlevel10k.zsh-theme";
        name = "powerlevel10k";
        src = "${zsh-powerlevel10k}/share/zsh-powerlevel10k";
      }
    ];
  };

  xdg.configFile = {
    "zsh/.p10k.zsh" = {
      source = ./p10k.zsh;
    };
  };
}

