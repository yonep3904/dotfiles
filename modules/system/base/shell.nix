# shell configuration

{ config, pkgs, lib, ... }:

{
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
