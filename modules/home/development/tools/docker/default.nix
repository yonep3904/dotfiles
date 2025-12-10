# docker evelopment tools
# docker: containerization platform

{ config, pkgs, lib, ... }:

let
  cfg = config.development.tools.docker;
in
{
  # This module only installs Docker related tools for user environment.
  # To enable Docker daemon, set the following in your configuration.nix (system level)

  # virtualisation.docker.enable = true;

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      docker-compose
      lazydocker
    ];
  };
}
