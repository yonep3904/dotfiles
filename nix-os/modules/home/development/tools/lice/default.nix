# lice development tools
# Lice: generate License files

{ config, pkgs, lib, ... }:

let
  cfg = config.development.tools.lice;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      lice
    ];
  };
}
