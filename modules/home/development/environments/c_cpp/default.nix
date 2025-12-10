# C/C++ development environment

{ config, pkgs, lib, ... }:

let
  cfg = config.development.environments.c_cpp;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gcc
      cmake
    ];
  };
}
