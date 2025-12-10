# Processing development environment

{ config, pkgs, lib, ... }:

let
  cfg = config.development.environments.processing;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      processing
    ];
  };
}
