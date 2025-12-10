# CLI tools and development tools

{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # utility tools
    tty-clock
    neofetch
    btop
    pingu

    # fun tools
    cowsay
    cmatrix

    # networking tools
    filebrowser

    # media tools
    ffmpeg
    yt-dlp-light

    # document tools
    texliveMedium
    typst
  ];
}
