# Development environment configurations

{ config, lib, pkgs, ... }:

let
  cfg = config.development;
in
{
  imports = [
    ./environments/arduino
    ./environments/c_cpp
    ./environments/go
    ./environments/javascript
    ./environments/julia
    ./environments/processing
    ./environments/python
    ./environments/rust

    ./tools/direnv
    ./tools/docker
    ./tools/gh
    ./tools/git
    ./tools/gotask
    ./tools/lice
    ./tools/ngrok
    ./tools/tokei
  ];

  options.development = {
    enable = lib.mkEnableOption "Enable development environment";

    environments = {
      arduino.enable = lib.mkEnableOption "Enable Arduino development tools";
      c_cpp.enable    = lib.mkEnableOption "Enable C/C++ development tools";
      go.enable       = lib.mkEnableOption "Enable Go development tools";
      javascript.enable = lib.mkEnableOption "Enable JavaScript development tools";
      julia.enable    = lib.mkEnableOption "Enable Julia development tools";
      processing.enable = lib.mkEnableOption "Enable Processing development tools";
      python.enable   = lib.mkEnableOption "Enable Python development tools";
      rust.enable     = lib.mkEnableOption "Enable Rust development tools";
    };

    tools = {
      direnv.enable = lib.mkEnableOption "Enable direnv tool";
      docker.enable = lib.mkEnableOption "Enable Docker tools";
      gh.enable     = lib.mkEnableOption "Enable GitHub CLI tool";
      git.enable    = lib.mkEnableOption "Enable Git tools";
      gotask.enable  = lib.mkEnableOption "Enable go-task tool";
      lice.enable    = lib.mkEnableOption "Enable lice tool";
      ngrok.enable   = lib.mkEnableOption "Enable ngrok tool";
      tokei.enable   = lib.mkEnableOption "Enable tokei tool";
    };
  };

  config = lib.mkIf cfg.enable {
    # General development packages
  };
}
