# Zsh configuration

{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    bat       # cat clonezilla
    eza       # ls clonezilla
    fzf       # fuzzy finder
    gtrash    # trash CLI tool
    ripgrep   # grep clonezilla
    tmux      # terminal multiplexer
    xclip     # clipboard tool
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza --icons always --group-directories-first ";
      la = "eza --icons always --group-directories-first --all ";
      ll = "eza --icons always  --group-directories-first --long --git ";
      l = "eza --icons always --group-directories-first --long --all --git ";
      tree-eza = "eza --icons always --group-directories-first --classify always --tree ";

      clip = "xclip -selection clipboard";
      del = "gtrash put ";
      update = "sudo nixos-rebuild switch";
    };

    initContent = ''
      # Powerlevel10k
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    '';

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";

    zplug = {
      enable = true;
      plugins = [
        {name = "zsh-users/zsh-autosuggestions";}
        {
          name = "romkatv/powerlevel10k";
          tags = [ "as:theme" "depth:1" ];
        }
      ];
    };
  };


  home.file.".p10k.zsh" = {
    source = ./.p10k.zsh;
    force = true;
  };
}
