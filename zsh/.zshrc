### The following lines were added by compinstall ###

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/leo/.zshrc'

autoload -Uz compinit
compinit
### End of lines added by compinstall ###

### Lines configured by zsh-newuser-install ###
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep
bindkey -e
### End of lines configured by zsh-newuser-install ###

######################################################

### Programming Languages ###
# Rust
. "$HOME/.cargo/env"
export PATH="/home/leo/.local/bin/:/home/leo/.cargo/bin/:$PATH"

# OCaml
source ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Haskell
[ -f "/home/leo/.ghcup/env" ] && source "/home/leo/.ghcup/env" # ghcup-env
###

### Zsh Plugins ###
# zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=246'

# zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
###

### Misc Shell Configuration ###
# Prompt color
PROMPT='%B%F{202}[%f%b%B%F{203}%n%f%b%B%F{204}@%f%b%B%F{205}%m%f%b%B%F{206}]%B%F{153}%~%f%b%B%F{207}$%f%k%b '

# Bindings
bindkey '^[[1;5D' backward-word # Ctrl+left_arrow
bindkey '^[[1;5C' forward-word # Ctrl + right_arrow
bindkey '^[[3~' delete-char # Del
###


### nnn file manager configuration
n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn -Ae "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}

# Aliases
alias vim=nvim
alias ls='ls --color=auto'

# nnn file manager plugins
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_PLUG='p:preview-tui;d:dragdrop'

export EDITOR='nvim'
###
