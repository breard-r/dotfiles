export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
export CLICOLOR=1
export EDITOR='emacs'
export PAGER='less'
export USER_NICKNAME="Rodolphe Breard"
export PATH="$PATH:$HOME/bin"


setopt nobeep appendhistory histignoredups histignorespace autocd extendedglob nomatch notify correct_all
bindkey -e
bindkey "^[[3~"  delete-char
bindkey "^[3;5~" delete-char

# Command completion
autoload -U compinit
compinit

# Prompt
if [ -f /usr/bin/liquidprompt ]; then
    unset PROMPT_COMMAND
    source /usr/bin/liquidprompt
elif [ -f "$HOME/liquidprompt/liquidprompt" ]; then
    unset PROMPT_COMMAND
    source "$HOME/liquidprompt/liquidprompt"
else
    if [ "$CLICOLOR" -ne 0 ]; then
        PS1="\[\033[01;31m\]\u\[\033[01;37m\]@\[\033[01;33m\]\h\[\033[01;31m\]->\[\033[00m\] "
    else
        PS1='\u@\h-> '
    fi
fi

# Syntax-highlighting
if [ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Aliases
if [ "$(uname -s | tr '[:upper:]' '[:lower:]')" = 'linux' ]; then
    alias ls='ls --color=auto'
fi
alias ll='ls -lihF'
alias la='ls -A'
alias l='ll -A'

alias sudo='sudo '
alias grep='grep -n --color=auto'
alias j='jobs'
alias ne='emacs'
alias df='df -h'
alias top='TERM=screen-256color htop'
alias weechat='TERM=screen-256color weechat'
alias lock='xscreensaver-command --lock'
