{
  description = "Configuration flake for my NixOS systems";

  inputs =
    {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

      nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

      nixos-hardware.url = "github:NixOS/nixos-hardware/master";

      home-manager = {
        url = "github:nix-community/home-manager/release-24.11";

        inputs.nixpkgs.follows = "nixpkgs";
      };

      firefox-addons = {
        url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";

        inputs.nixpkgs.follows = "nixpkgs-unstable";
      };
    };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nixos-hardware,
      home-manager,
      firefox-addons
    }@inputs:

    let
      mkStableNixOSConfiguration =
        {
          host,
          nixpkgs,
          nixpkgs-unstable,
          home-manager,
          extraModules ? [ ],
          flake-inputs ? { }
        }:
        nixpkgs.lib.nixosSystem {
          modules = [
            ./machines/${host.directory}/configuration.nix
            ./overlays
            home-manager.nixosModules.home-manager
            {
              nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
                "zoom"
              ];
              home-manager.useGlobalPkgs = true;
              home-manager.users.choreutes = import ./home-manager/choreutes/machines/${host.name}/home.nix;
            }
          ] ++ extraModules;

          specialArgs = {
            inherit flake-inputs;

            pkgs-unstable = (import nixpkgs-unstable) { inherit (host) system; };
          };

          inherit (host) system;
        };
    in
    {
      nixosConfigurations = {
        artemis = mkStableNixOSConfiguration {
          host = {
            directory = "artemis";
            name = "artemis";
            system = "x86_64-linux";
          };

          inherit nixpkgs nixpkgs-unstable home-manager;

          extraModules = [ nixos-hardware.nixosModules.lenovo-thinkpad-t14s-amd-gen1 ];

          flake-inputs = { inherit firefox-addons; };
        };
      };
    };
}
