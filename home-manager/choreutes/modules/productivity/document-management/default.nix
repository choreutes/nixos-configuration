{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./papis.nix
  ];

  config = {
    home.packages = with pkgs; [
      jabref
    ];
  };
}
