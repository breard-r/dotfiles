HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
CLICOLOR=1
export EDITOR='emacs'
export PAGER='less'
export USER_NICKNAME="Rodolphe Breard"

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
    PS1="\[\033[01;31m\]\u\[\033[01;37m\]@\[\033[01;33m\]\h\[\033[01;31m\]->\[\033[00m\] "
    #PS1='\u@\h-> '
fi

# Syntax-highlighting
if [ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Aliases
if [ "$(uname -s | tr '[:upper:]' '[:lower:]')" = 'linux' ]; then
    alias ls='ls --color=auto'
fi
alias ll='ls -lih'
alias la='ls -A'
alias l='ls -lihA'

alias sudo='sudo '
alias grep='grep -n --color=auto'
alias j='jobs'
alias ne='emacs'
alias df='df -h'
alias top='TERM=screen-256color htop'
alias weechat='TERM=screen-256color weechat'
alias lock='xscreensaver-command --lock'

# Usage: venv project_name
# Activate the python virtualenv for <project_name>.
venv()
{
    if [ -f "${HOME}/venvs/$1/bin/activate" ]; then
	    . "${HOME}/venvs/$1/bin/activate"
    fi
}
