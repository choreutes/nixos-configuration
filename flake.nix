{
  description = "Configuration flake for my NixOS systems";

  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixos-hardware, nixpkgs }: {
    nixosConfigurations = {
      artemis = nixpkgs.lib.nixosSystem {
        modules = [
          nixos-hardware.nixosModules.lenovo-thinkpad-t14s-amd-gen1
          ./machines/artemis/configuration.nix
        ];

        system = "x86_64-linux";
      };
    };
  };
}
