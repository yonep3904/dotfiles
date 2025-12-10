# GoLang development environment

{ config, pkgs, lib, ... }:

let
  cfg = config.development.environments.go;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      go
    ];
  };
}
