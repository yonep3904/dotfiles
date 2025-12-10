# Julia development environment

{ config, pkgs, lib, ... }:

let
  cfg = config.development.environments.julia;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      julia
    ];
  };
}
