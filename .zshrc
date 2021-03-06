setopt no_beep inc_append_history hist_ignore_dups hist_ignore_space extended_glob no_match notify
bindkey -e
bindkey "^[[3~"  delete-char
bindkey "^[3;5~" delete-char
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=5000
export SAVEHIST=100000
export CLICOLOR=1
export EDITOR='vim'
export PAGER='less'
export USER_NICKNAME="Rodolphe Bréard"
export DEBEMAIL="packages+deb@what.tf"
export DEBFULLNAME="$USER_NICKNAME"

# Path
[ -f ~/.setpath.sh ] && . ~/.setpath.sh

# Colors
[ "$CLICOLOR" -ne 0 ] && hash dircolors 2>/dev/null && eval $(dircolors -b)

# Command completion
autoload -U compinit
compinit

# Prompt
if [ -f "/usr/bin/liquidprompt" ]; then
    unset PROMPT_COMMAND
    . "/usr/bin/liquidprompt"
elif [ -f "$HOME/liquidprompt/liquidprompt" ]; then
    unset PROMPT_COMMAND
    . "$HOME/liquidprompt/liquidprompt"
elif [ "$CLICOLOR" -ne 0 ]; then
    autoload -U colors && colors
    PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[yellow]%}%M%{$fg[red]%}->%{$reset_color%} "
else
    PS1='%n@%M-> '
fi

# Syntax-highlighting
if [ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    . "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Aliases
[ -f "$HOME/.aliases" ] && . "$HOME/.aliases"

# Proxy settings
[ -f "$HOME/.proxy" ] && . "$HOME/.proxy"

# Compose key
[ -f ~/.set_compose_key.sh ] && . ~/.set_compose_key.sh

# skim
[ -f "/usr/share/skim/key-bindings.zsh" ] && . /usr/share/skim/key-bindings.zsh
[ -f "/usr/share/skim/completion.zsh" ] && . /usr/share/skim/completion.zsh

# Pew
hash pew 2>/dev/null && source $(pew shell_config)

# Java
#
# Use `archlinux-java` to change the default Java environment.
# List directories in `/usr/lib/jvm/` to see all possible values.
#
# Example:
#   sudo archlinux-java set java-13-openjdk
export JAVA_HOME="/usr/lib/jvm/default"

# Exit with a success status
true
