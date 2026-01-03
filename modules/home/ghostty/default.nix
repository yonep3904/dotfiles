# Ghostty (Terminal emulator)

{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    ghostty
  ];

  xdg.configFile."ghostty/config" = {
    source = ./config;
    force = true;
  };
}
