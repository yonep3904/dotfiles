{ config, pkgs, lib, ... }:

{
  users.users.keita = {
    isNormalUser = true;
    description = "keita";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"  # docker
      "dialout" "uucp" # Arduino
    ];
  };
}
