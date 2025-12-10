# Dell Inspiron 14 5445 specific hardware configuration

/*
Dell Inspiron 14 5445
CPU: AMD Ryzen 7 8840U (x86_64)
GPU: AMD Radeon Graphics
WiFi: Realtek Wi-Fi 6 RTL8852BE
Audio: Realtek ALC3254
*/

{ config, pkgs, lib, ... }:

{
  # GPU settings for AMD
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  # hardware.opengl.enable = true;  # hardware.opengl is deprecated, use hardware.graphics.enable instead

  # Bluetooth settings
  hardware.bluetooth.enable = true;

  # Power management settings
  services.tlp.enable = true;
  services.power-profiles-daemon.enable = lib.mkForce false; # Disable to avoid conflicts with TLP

  # Enable redistributable firmware (required for Realtek RTL8852BE Wi-Fi and others)
  hardware.enableRedistributableFirmware = true;

  # AMD CPU performance settings
  boot.kernelParams = [ "amd_pstate=active" ];
}
