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
    }: 

    {
      nixosConfigurations = {
        artemis = nixpkgs.lib.nixosSystem {
          modules = [
            ./machines/artemis/configuration.nix
            nixos-hardware.nixosModules.lenovo-thinkpad-t14s-amd-gen1
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit firefox-addons; };
              home-manager.users.choreutes = import ./home-manager/choreutes/machines/artemis/home.nix;
            }
          ];

          system = "x86_64-linux";
        };
      };
    };
}
