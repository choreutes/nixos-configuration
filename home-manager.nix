{
  flake-inputs,
  ...
}:

{
  home-manager = {
    extraSpecialArgs = { inherit flake-inputs; };

    useGlobalPkgs = true;
  };
}
