# NixOS configuration

{ config, pkgs, lib, ... }:

{
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      # accept-flake-config = true;
      # trusted-users = [ "root" "@wheel" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Enable nix-ld for improved Nix builds
  programs.nix-ld.enable = true;

  # allow installation of proprietary software
  nixpkgs.config.allowUnfree = true;
}
