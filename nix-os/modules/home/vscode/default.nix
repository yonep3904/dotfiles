{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    hackgen-nf-font
    vscode
  ];

  # home.file.".config/Code/User/settings.json" = {
  #   source = ./settings.json;
  #   force = true;
  # };
}
