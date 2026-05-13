# Docker configuration

{ config, pkgs, lib, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;          # Start Docker service on boot
      rootless = {                  # Enable rootless Docker
        enable = true;
        setSocketVariable = true;
      };
    };
  };
}
