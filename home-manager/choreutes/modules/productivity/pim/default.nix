{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.host-specific.productivity.pim;
in
{
  imports = [
    ./calendar.nix
    ./contacts.nix
  ];

  options = with lib; {
    host-specific.productivity.pim.enable = mkOption {
      description = "Whether to enable configuration of personal information managers";
      default = config.host-specific.productivity.enable;
      example = true;
      type = with types; bool;
    };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      khal.enable = true;
      khard.enable = true;
      vdirsyncer.enable = true;
    };
  };
}
