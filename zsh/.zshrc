[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/leo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# My stuff
. "$HOME/.cargo/env"

export PATH="/home/leo/.local/bin/:/home/leo/.cargo/bin/:$PATH"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=246'

PROMPT='%B%F{202}[%f%b%B%F{203}%n%f%b%B%F{204}@%f%b%B%F{205}%m%f%b%B%F{206}]%B%F{153}%~%f%b%B%F{207}$%f%k%b '

source ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

[ -f "/home/leo/.ghcup/env" ] && source "/home/leo/.ghcup/env" # ghcup-env

# Bindings
bindkey '^[[1;5D' backward-word # Ctrl+left_arrow
bindkey '^[[1;5C' forward-word # Ctrl + right_arrow
bindkey '^[[3~' delete-char # Del

# Aliases
alias vim=nvim
alias ls='ls --color=auto'

# Zap commands
plug "zsh-users/zsh-autosuggestions"
plug "git"
alias config='/usr/bin/git --git-dir=/home/leo/.config/ --work-tree=/home/leo'
