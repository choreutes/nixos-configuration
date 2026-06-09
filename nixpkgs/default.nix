{
  ...
}:

{
  imports = [
    ./overlays
    ./unfree
  ];

  # Dirty hack for Zulip to continue working.
  # Remove as soon as possible!
  config = {
    nixpkgs.config.permittedInsecurePackages = [
      "electron-39.8.10"
    ];
  };
}
