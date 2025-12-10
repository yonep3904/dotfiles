# Rust development environment

{ config, pkgs, lib, ... }:

let
  cfg = config.development.environments.rust;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      rustup
    ];
  };
}
