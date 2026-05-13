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

    # pdf tools
    pdfpc
    zathura
    poppler-utils

    # AI tools
    codex

    # document tools
    # texliveMedium
    typst
    typstyle
    ipafont
    udev-gothic-nf
    noto-fonts-cjk-sans-static
    noto-fonts-cjk-serif-static
    texliveFull
    pandoc
  ];
}
