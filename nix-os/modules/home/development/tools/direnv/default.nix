# direnv development tools
# direnv: per-project environment variable manager

{ config, pkgs, lib, ... }:

let
  cfg = config.development.tools.direnv;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      direnv
    ];
  };
}
