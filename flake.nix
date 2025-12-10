{
  description = "NixOS and Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in

  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      # devShells
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          # packages for development shell
          # git
          # vim
          # wget
        ];
      };

      formatter = pkgs.nixpkgs-fmt;

      checks = {
        default = self.nixosConfigurations.NixOS.config.system.build.toplevel;
      };
    }
  ) // {
    # NixOS system configuration
    nixosConfigurations = {
      "yone-pc-nix" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/yone-pc-nix/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.users.keita = {
              imports = [
                ./hosts/yone-pc-nix/keita.nix
              ];
            };
          }
        ];
      };
    };
  };
}
