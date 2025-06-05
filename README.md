# My NixOS configuration files

[![Made with Neovim](https://img.shields.io/badge/Made%20with-Neovim-d3e4db&?style=flat&logo=neovim)](https://neovim.io)
[![NixOS](https://img.shields.io/badge/NixOS-25.05-green?style=flat&logo=nixos&logoColor=white)](https://nixos.org)

## How the repository will be organized (eventually)

Part of this configuration goes back years ago to when I started using NixOS and had no clue how any of this worked.
Additionally this was orignally two separate repositories before I made the switch from standalone home-manager to the NixOS module.
That is why the structure of this repository is kind of a mess at the moment.

For now the following is more of a scratchpad of how the configuration *could* be structured.
I will play around with it for a bit and then start refactoring the configuration.
Over time the real structure and the scratchpad will hopefully converge.

    nixos-configuration
    ┣━flake.nix
    ┣━flake.lock
    ┣━hosts/
    ┃ ┣━artemis/
    ┃ ┃ ┣━configuration.nix
    ┃ ┃ ┗━hardware-configuration.nix
    ┃ ┣━butler/
    ┃ ┃ ┣━configuration.nix
    ┃ ┃ ┗━hardware-configuration.nix
    ┃ ┗━opal/
    ┃   ┣━configuration.nix
    ┃   ┣━hardware-configuration.nix
    ┃   ┗━network-configuration.nix
    ┣━modules/
    ┃ ┣━common/
    ┃ ┣━gui/
    ┃ ┃ ┣━plasma.nix
    ┃ ┃ ┗━sway.nix
    ┃ ┣━home-manager/
    ┃ ┣━mailserver/
    ┃ ┣━webserver/
    ┃ ┗━wireless/
    ┣━nixpkgs/
    ┃ ┣━overlays.nix
    ┃ ┗━unfree-packages.nix
    ┗━users/
      ┣━choreutes/
      ┃ ┣━login_password (not included)
      ┃ ┗━home-configuration/
      ┃   ┣━hosts/
      ┃   ┃ ┣━artemis.nix
      ┃   ┃ ┣━butler.nix
      ┃   ┃ ┗━opal.nix
      ┃   ┗━modules/
      ┃     ┣━common/
      ┃     ┣━gaming/
      ┃     ┣━media/
      ┃     ┗━productivity/
      ┗━root/

Most of the directories above will contain `default.nix` files.
They are not included in the structure as they would not add any additional information but considerably clutter the overall picture.

## Custom options

Some of the configuration modules above declare custom options.
These are mostly used to configure certain behaviour *per host*, e.g. which desktop environment to install, where specifig data files reside, etc.

### System-wide

### home-manager

    host-specific
    ┣━ledger
    ┃ ┣━file
    ┃ ┗━pricedb
    ┗━papis
      ┗━library-dir

## How to use this configuration
