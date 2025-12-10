# NixOS Configuration for yone-pc-nix

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ../../modules/system/applications/cups.nix
      ../../modules/system/applications/docker.nix
      ../../modules/system/applications/ssh.nix
      ../../modules/system/applications/steam.nix
      ../../modules/system/applications/tailscale.nix

      ../../modules/system/base/boot.nix
      ../../modules/system/base/locale.nix
      ../../modules/system/base/network.nix
      ../../modules/system/base/nix.nix
      ../../modules/system/base/shell.nix

      ../../modules/system/desktop/fcitx5.nix
      ../../modules/system/desktop/fonts.nix
      ../../modules/system/desktop/hyprland.nix
      ../../modules/system/desktop/pipewire.nix
      # ../../modules/system/desktop/plasma.nix

      ../../modules/system/hardware/inspiron-5445.nix
      ../../modules/user/keita.nix
    ];

  networking.hostName = "yone-pc-nix";

  # system packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    zip
    unzip
    tree
    git
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
