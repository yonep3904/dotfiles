# Steam configuration

{ config, pkgs, lib, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;       # Enable firewall for Steam Remote Play
    dedicatedServer.openFirewall = true;  # Enable firewall for Steam Dedicated Server
  };
}
