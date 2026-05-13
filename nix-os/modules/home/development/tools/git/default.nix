# Git development tools

{ config, pkgs, lib, ... }:

let
  cfg = config.development.tools.git;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      git
      git-filter-repo   # Git history rewriting tool
      cz-cli            # Commitizen CLI for conventional commits
      lazygit           # Simple terminal UI for git commands
      onefetch          # A command-line GitHub repository summary tool
    ];

    home.file.".gitconfig" = {
      source = ./.gitconfig;
      force = true;
    };
  };
}

