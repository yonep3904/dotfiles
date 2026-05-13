# Python development environment

{ config, pkgs, lib, ... }:

let
  python = pkgs.python312;    # latest LTS version of Python
  # pythonPackages = pkgs.python312Packages;

  cfg = config.development.environments.python;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [

      # Python with commonly used packages
      (python.withPackages (ps: with ps; [
        # data science / machine learning
        numpy
        scipy
        pandas
        matplotlib
        scikit-learn

        # development tools
        black
        mypy

        # interactive computing
        ipython
      ]))

      # project management
      uv
    ];

    # Set PIP_REQUIRE_VIRTUALENV to true to prevent pip from installing packages globally
    home.sessionVariables = {
      PIP_REQUIRE_VIRTUALENV = "true";
    };
  };
}
