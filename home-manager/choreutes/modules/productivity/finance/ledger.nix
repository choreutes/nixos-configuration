{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.host-specific.ledger;
in {
  options = with lib; {
    host-specific.ledger.file = mkOption {
      type = with types; uniq str;
    };

    host-specific.ledger.pricedb = mkOption {
      type = with types; uniq str;
    };
  };

  config = {
    programs.ledger = {
      enable = true;

      settings = {
        date-format = "%Y-%m-%d";
        decimal-comma = true;
        file = "${cfg.file}";
        price-db = "${cfg.pricedb}";
        strict = true;
      };
    };
  };
}
