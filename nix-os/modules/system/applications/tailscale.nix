# Tailscale configuration

{ config, pkgs, lib, ... }:

{
  services.tailscale = {
    enable = true;
    openFirewall = true;            # Open necessary firewall ports
    useRoutingFeatures = "server";  # Enable routing features for server
  };
}
