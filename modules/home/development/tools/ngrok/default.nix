# ngrok development tools
# ngrok: secure introspectable tunnels to localhost

{ config, pkgs, lib, ... }:

let
  cfg = config.development.tools.ngrok;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      ngrok
    ];
  };
}
