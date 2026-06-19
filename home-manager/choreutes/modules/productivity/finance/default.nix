{
  config,
  lib,
  ...
}:

{
  imports = [
    ./ledger.nix
  ];

  options = with lib; {
    host-specific.productivity.finance.enable = mkOption {
      description = "Whether to enable programs related to financial accounting";
      default = config.host-specific.productivity.enable;
      example = true;
      type = with types; bool;
    };
  };
}
