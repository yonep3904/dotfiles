# Font configuration

{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    hackgen-nf-font
  ];
}
