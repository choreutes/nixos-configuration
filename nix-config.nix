{
  nixpkgs
}:

{
  config,
  ...
}:

{
  config = {
    nix = {
      nixPath = [ "nixpkgs=${nixpkgs}" ];

      registry.nixpkgs.flake = nixpkgs;
    };
  };
}
