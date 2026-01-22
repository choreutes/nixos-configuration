{
  description = "Configuration flake for my NixOS systems";

  inputs =
    {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

      nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

      nixos-hardware.url = "github:NixOS/nixos-hardware/master";

      nixos-mailserver = {
        inputs = {
          nixpkgs.follows = "nixpkgs";
        };
        owner = "simple-nixos-mailserver";
        ref = "nixos-25.11";
        repo = "nixos-mailserver";
        type = "gitlab";
      };

      home-manager = {
        url = "github:nix-community/home-manager/release-25.11";

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
      nixos-mailserver,
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
            ./hosts/${host.directory}/configuration.nix
            ./nixpkgs
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.users.choreutes = import ./home-manager/choreutes/hosts/${host.name}/home.nix;
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

          extraModules = [ nixos-hardware.nixosModules.lenovo-thinkpad-l14-amd ];

          flake-inputs = { inherit firefox-addons; };
        };

        opal = mkStableNixOSConfiguration {
          host = {
            directory = "opal";
            name = "opal";
            system = "x86_64-linux";
          };

          inherit nixpkgs nixpkgs-unstable home-manager;

          extraModules = [ nixos-mailserver.nixosModule ];
        };
      };
    };
}
