# GitHub CLI development tools

{ config, pkgs, lib, ... }:

let
  cfg = config.development.tools.gh;
in
{
  config = lib.mkIf cfg.enable {
    programs.gh = {
      enable = true;
      extensions = with pkgs; [
        gh-dash
        gh-markdown-preview
        # gh-q
      ];
    };
  };
}
