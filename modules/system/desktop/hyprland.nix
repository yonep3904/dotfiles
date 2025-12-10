# Hyprland desktop environment configuration

{ config, pkgs, lib, ... }:

{
  programs.hyprland.enable = true;
  programs.xwayland.enable = true;

  services.dbus.enable = true;
  services.libinput.enable = true;
  security.polkit.enable = true;

  # console.keyMap = "jp";
  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command = "dbus-run-session ${pkgs.hyprland}/bin/Hyprland";
  #       user = "keita";
  #     };
  #   };
  # };

  ## ロック画面（推奨）
  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session.command = "${pkgs.hyprland}/bin/Hyprland";
  #   };
  # };


  # Don't forget add "video" and "input" to your user extraGroups
}
