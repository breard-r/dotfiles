alias sudo='sudo '

if [ "$OSTYPE" == "FreeBSD" ]; then
    alias ls='ls --color=auto'
else
    alias ls='ls -D'
fi
alias ll='ls -lih'
alias la='ls -A'
alias l='ls -lihA'

alias grep='grep -n --color=auto'
alias j='jobs'
alias emacs='TERM=xterm emacs'
alias ne='emacs'
alias df='df -h'
alias top='htop'

alias lock='xscreensaver-command --lock'
