# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Instead of this, copy:
# /usr/share/terminfo/r/rxvt-unicode into ~/.terminfo/r/rxvt-unicode
# /usr/share/terminfo/r/rxvt-unicode-256color into ~/.terminfo/r/rxvt-unicode-256color
#export TERM=xterm

# Exporting nickname
export USER_NICKNAME="Rodolphe Breard"

# Exporting DEB settings
export DEBEMAIL="rodolphe.breard@uraniborg.net"
export DEBFULLNAME="$USER_NICKNAME"

# Ruby bin directory
if [ -d "$HOME/.gem/ruby" ]; then
    for file in $HOME/.gem/ruby/*; do
	if [ -d "$file" -a -d "$file/bin" ]; then
	    export PATH="$PATH:$file/bin"
	fi
    done
fi

# Custom bin directory
if [ -d "$HOME/bin" ]; then
    export PATH="$PATH:$HOME/bin"
fi

# OS
OS_TYPE=$(echo "$OSTYPE" | sed 's/\([a-zA-Z_\-]*\).*/\1/g')

# Colors
if [ "$OS_TYPE" != "freebsd" ]; then
    eval $(dircolors -b)
fi

# append to the history file, don't overwrite it
shopt -s histappend

# don't save lines matching the previous history entry
export HISTCONTROL=ignoredups

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Set the prompt
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

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
complete -cf sudo

# exporting editor and pager
export EDITOR='emacs'
export PAGER='less'

# rbenv
hash rbenv 2>/dev/null && eval "$(rbenv init -)"

# GPG Agent
if [ -f "${HOME}/.gpg-agent-info" ]; then
    . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
fi
export GPG_TTY=$(tty)
