# JavaScript development environment

{ config, pkgs, lib, ... }:

let
  cfg = config.development.environments.javascript;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nodejs_24                 # Node.js (global installation)

      # corepack                  # Node.js package manager (Node.js 20 and above include Corepack by default)
      # nodePackages.typescript   # TypeScript support
      # bun                       # Bun
      # deno                      # Deno
    ];
  };
}
