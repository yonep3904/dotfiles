{ config, pkgs, lib, ... }:

{
  users.users.keita = {
    isNormalUser = true;
    description = "keita";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"   # hyprland
      "input"   # hyprland
      "docker"  # docker
    ];
  };
}
