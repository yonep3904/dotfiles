# Alacritty (Terminal emulator)

{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    alacritty
  ];

  xdg.configFile."alacritty/alacritty.toml" = {
    source = ./alacritty.toml;
    force = true;
  };
}
