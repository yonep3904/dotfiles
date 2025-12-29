{ config, pkgs, lib, ... }:

{
  imports = [
    ../../modules/home/alacritty
    ../../modules/home/applications
    ../../modules/home/development
    # ../../modules/home/fcitx5
    ../../modules/home/fonts
    ../../modules/home/vscode
    ../../modules/home/zsh

    ../../modules/home/xdg
  ];

  #############################
  # Identity
  #############################
  home = {
    username = "keita";
    homeDirectory = "/home/keita";
    sessionVariables = {
      # XDG_SESSION_TYPE = "wayland";
      # MOZ_ENABLE_WAYLAND = "1";   # Firefox用
      # QT_QPA_PLATFORM = "wayland";
      # NIXOS_OZONE_WL = "1";       # Chrome/Brave用

      EDITOR = "nano";
      BROWSER = "brave";
      TERMINAL = "alacritty";
      SHELL = "${pkgs.zsh}/bin/zsh";
    };
  };


  #############################
  # Package management
  #############################
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    discord
    slack
    spotify
    teams-for-linux
    zoom-us

    audacity
    drawio
    gimp
    inkscape
    vlc

    wireshark-qt

    firefox
    brave
    google-chrome
  ];

  development = {
    enable = true;
    environments = {
      arduino.enable = true;
      c_cpp.enable = true;
      go.enable = true;
      javascript.enable = true;
      julia.enable = true;
      processing.enable = true;
      python.enable = true;
      rust.enable = true;
    };
    tools = {
      docker.enable = true;
      direnv.enable = true;
      gh.enable = true;
      git.enable = true;
      gotask.enable = true;
      lice.enable = true;
      ngrok.enable = true;
      tokei.enable = true;
    };
  };

  #############################
  # State version
  #############################
  home.stateVersion = "25.11";  # Don't change this version
}
