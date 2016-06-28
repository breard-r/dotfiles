# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

shopt -s checkwinsize
shopt -s histappend
export HISTCONTROL=ignoredups
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
[ -f /etc/bash_completion ] && . /etc/bash_completion

# Prompt
if [ -f "/usr/bin/liquidprompt" ]; then
    unset PROMPT_COMMAND
    . "/usr/bin/liquidprompt"
elif [ -f "$HOME/liquidprompt/liquidprompt" ]; then
    unset PROMPT_COMMAND
    . "$HOME/liquidprompt/liquidprompt"
elif [ "$CLICOLOR" -ne 0 ]; then
    PS1="\[\033[01;31m\]\u\[\033[01;37m\]@\[\033[01;33m\]\h\[\033[01;31m\]->\[\033[00m\] "
else
    PS1='\u@\h-> '
fi

# GPG Agent
export GPG_TTY=$(tty)
export GPG_AGENT_INFO="/run/user/${UID}/gnupg/S.gpg-agent"
export SSH_AUTH_SOCK="/run/user/${UID}/gnupg/S.gpg-agent.ssh"
export SSH_AGENT_PID=$(pgrep -x -u "${USER}" gpg-agent)

# Aliases
[ -f "$HOME/.aliases" ] && . "$HOME/.aliases"
