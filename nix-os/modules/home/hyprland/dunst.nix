{ config, pkgs, lib, ... }:

let
  bg = "#222436";
  fg = "#c8d3f5";

  black = "#1b1d2b";
  red = "#ff757f";
  green = "#c3e88d";
  yellow = "#ffc777";
  blue = "#82aaff";
  magenta = "#c099ff";
  cyan = "#86e1fc";
  white = "#828bb8";
in
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 1;
        timeout = 10;
        offset = "30x30";
        transparency = 10;
        foreground = fg;
        background = black;
        frame_color = black;
        corner_radius = 10;
        font = "Noto Sans CJK JP";
      };
      urgency_critical = {
        frame_color = red;
      };
    };
  };
}
