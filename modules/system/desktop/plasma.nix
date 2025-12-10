# Plasma Desktop Environment(Plasma/SDDM, X11, XKB) configuration

{ config, pkgs, lib, ... }:

{
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver = {
    enable = true;
    videoDrivers = ["amdgpu"];
  };

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "jp";
    variant = "";
  };

  # Bluetooth support in Plasma
  # services.bluedevil.enable = true;
}
