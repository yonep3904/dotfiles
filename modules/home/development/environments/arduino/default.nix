# Arduino development environment

{ config, pkgs, lib, ... }:

let
  cfg = config.development.environments.arduino;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      arduino-cli # CLI tool
      arduino-ide
      # arduino     # GUI tool
    ];
  };
}
