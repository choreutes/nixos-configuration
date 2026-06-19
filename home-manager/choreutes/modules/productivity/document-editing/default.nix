{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.host-specific.productivity.document-editing;
in
{
  imports = [
    ./latex.nix
  ];

  options = with lib; {
    host-specific.productivity.document-editing.enable = mkOption {
      description = "Whether to install programs to create or edit documents";
      default = config.host-specific.productivity.enable;
      example = true;
      type = with types; bool;
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      libreoffice-qt-fresh
      typst
    ];
  };
}
