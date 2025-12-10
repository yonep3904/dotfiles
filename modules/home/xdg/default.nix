# XDG user directories configuration

{ config, pkgs, lib, ... }:

{
  # xdg.configFile."mimeapps.list".force = true;

  # XDG settings
  xdg.enable = true;

  # User directories
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = "$HOME/Desktop";
    download = "$HOME/Downloads";
    documents = "$HOME/Documents";
    music = "$HOME/Music";
    pictures = "$HOME/Pictures";
    videos = "$HOME/Videos";
    publicShare = "$HOME/Public";
    templates = "$HOME/Templates";
  };
}
