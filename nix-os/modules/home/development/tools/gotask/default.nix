# go-task development tools

{ config, pkgs, lib, ... }:

let
  cfg = config.development.tools.gotask;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      go-task
    ];
  };
}
