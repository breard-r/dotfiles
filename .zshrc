setopt nobeep appendhistory histignoredups histignorespace extendedglob nomatch notify correct_all
bindkey -e
bindkey "^[[3~"  delete-char
bindkey "^[3;5~" delete-char
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
export CLICOLOR=1
export EDITOR='vim'
export PAGER='less'
export USER_NICKNAME="Rodolphe Breard"
export DEBEMAIL="packages+deb@what.tf"
export DEBFULLNAME="$USER_NICKNAME"
[[ ":$PATH:" == *":$HOME/bin:"* ]] || export PATH="$HOME/bin:$PATH"

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

# GPG Agent
export GPG_TTY=$(tty)
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
fi

# Aliases
[ -f "$HOME/.aliases" ] && . "$HOME/.aliases"
