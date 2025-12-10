# tokei development tools
# Tokei(時計): count lines of code

{ config, pkgs, lib, ... }:

let
  cfg = config.development.tools.tokei;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      tokei
    ];
  };
}
