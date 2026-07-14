# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
CASE_SENSITIVE="false"
# _ and - will be interchangeable.
HYPHEN_INSENSITIVE="false"
zstyle ':omz:update' mode disabled
ENABLE_CORRECTION="false"

plugins=(zsh-autosuggestions
    zsh-vi-mode
    docker
    docker-compose
    ssh
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit

# Ignore ctrl + d to exit shell
set -o ignoreeof

# docker
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)

# promt
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

. "$HOME/.cargo/env"

# aliases
alias vim="nvim"
alias ls='ls -lAhF --color=auto --group-directories-first'

PATH="$HOME/.local/bin:$PATH"

export OPENCODE_EXPERIMENTAL=true
export OPENCODE_ENABLE_EXA=true

ZVM_SYSTEM_CLIPBOARD_ENABLED=true
eval "$(zoxide init --cmd cd zsh)"

# Detect Operating System
case "$OSTYPE" in
  darwin*)
    # macOS-specific settings

    # gnu coreutils without prefix
    PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
    PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/diffutils/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/awk/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/gnu-which/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/gnu-indent/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/python@3.14/libexec/bin:$PATH"
    PATH="/opt/homebrew/opt/openssh/libexec/bin:$PATH"
    PATH="/opt/homebrew/opt/inetutils/libexec/gnubin:$PATH"
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    ;;
  linux*)
    # Linux-specific settings
    ;;
esac
