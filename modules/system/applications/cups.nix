# CUPS (Common Unix Printing System) configuration module

{ config, pkgs, lib, ... }:

{
  services.printing.enable = true;
}
