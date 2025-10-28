{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.host-specific.cryptoplexity;
in
{
  options = with lib; {
    host-specific.cryptoplexity.enable = mkEnableOption "Cryptoplexity specific packages";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        openconnect
        zoom-us
        zulip
        zulip-term
      ];
    };
  };
}
