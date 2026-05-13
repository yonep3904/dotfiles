# Fcitx5 input method configuration

{ config, pkgs, lib, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      # fcitx5-configtool
      # fcitx5-chinese-addons
    ];
    # enabled = "fcitx5";
    # fcitx5.addons = [pkgs.fcitx5-mozc];
  };
}
