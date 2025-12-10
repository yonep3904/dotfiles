# Hyprland desktop environment configuration

{ config, pkgs, lib, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    # xwayland = true;
  };
  programs.xwayland.enable = true;

  services.dbus.enable = true;
  services.libinput.enable = true;
  security.polkit.enable = true;

  # enable greetd
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "dbus-run-session ${pkgs.hyprland}/bin/Hyprland";
        user = "keita";
      };
    };
  };

  # Wayland support packages
  environment.systemPackages = with pkgs; [
    wayland
    wayland-utils
    wl-clipboard
    grim
    slurp
    kitty
  ];

  # Japanese keyboard layout for Wayland
  services.xserver.enable = false;
  console.useXkbConfig = true;
  # console.keyMap = "jp";

  # Don't forget add "video" and "input" to your user extraGroups
}
