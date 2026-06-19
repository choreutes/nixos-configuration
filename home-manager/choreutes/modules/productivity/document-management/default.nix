{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.host-specific.productivity.document-management;
in
{
  imports = [
    ./papis.nix
  ];

  options = with lib; {
    host-specific.productivity.document-management.enable = mkOption {
      description = "Whether to enable tools to manage documents and references";
      default = config.host-specific.productivity.enable;
      example = true;
      type = with types; bool;
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      jabref
    ];
  };
}
