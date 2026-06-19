{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.host-specific.productivity.finance;
in {
  options = with lib; {
    host-specific.productivity.finance.ledger-file = mkOption {
      description = "The location of the main ledger file to be used";
      type = with types; uniq str;
    };

    host-specific.productivity.finance.ledger-pricedb = mkOption {
      description = "The location of the main ledger pricedb to be used";
      type = with types; uniq str;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.ledger = {
      enable = true;

      settings = {
        date-format = "%Y-%m-%d";
        decimal-comma = true;
        file = "${cfg.ledger-file}";
        price-db = "${cfg.ledger-pricedb}";
        strict = true;
      };
    };
  };
}
