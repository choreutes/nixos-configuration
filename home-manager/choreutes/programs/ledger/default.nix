{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ledger
  ];

  programs.zsh.shellAliases = {
    "ledger" = "ledger --decimal-comma --explicit --strict --file $LEDGER_HOME/main.ledger";
  };
}
