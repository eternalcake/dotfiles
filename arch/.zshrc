# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
CASE_SENSITIVE="false"
# _ and - will be interchangeable.
HYPHEN_INSENSITIVE="false"
zstyle ':omz:update' mode disabled
ENABLE_CORRECTION="false"

plugins=(zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-vi-mode
    docker
    docker-compose
    ssh
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit

# docker
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

source $ZSH/oh-my-zsh.sh

# promt
autoload -U promptinit; promptinit
prompt pure

. "$HOME/.cargo/env"

# aliases
alias vim="nvim"
alias ls='ls -lAhF --group-directories-first --color=auto'

ZVM_SYSTEM_CLIPBOARD_ENABLED=true
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
