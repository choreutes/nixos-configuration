{
  lib,
  ...
}:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "cups-brother-hll2340dw" "zoom" ];
}
