# zshrc for Ubuntu

##################################
# ohmyzsh
##################################

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

##################################
# Language environment
#=================================

typeset -U path PATH

# golang
path+=("$HOME/go/bin")

# juliaup
path+=("$HOME/.juliaup/bin")

# uv
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"

# nvm
export NVM_DIR="$HOME/.nvm"

[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

export PATH

##################################
# Alias
##################################

# python
alias python='python3'

##################################
# Terminal utilities
##################################

# zoxide
# eval "$(zoxide init zsh)"
eval "$(zoxide init zsh --cmd cd)"

# eza
alias ls='eza --icons --group-directories-first'
alias ll='eza -l --git --icons --group-directories-first'
alias l='eza -la --git --icons --group-directories-first'

# bat
alias bat='batcat'

# ripgrep
alias rg='rg --hidden --glob "!.git/*"'

# fd
alias fd='fdfind'

# fzf
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && \
  source /usr/share/doc/fzf/examples/key-bindings.zsh

[ -f /usr/share/doc/fzf/examples/completion.zsh ] && \
  source /usr/share/doc/fzf/examples/completion.zsh
