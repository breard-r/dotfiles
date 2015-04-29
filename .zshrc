setopt nobeep appendhistory histignoredups histignorespace autocd extendedglob nomatch notify correct_all
bindkey -e
bindkey "^[[3~"  delete-char
bindkey "^[3;5~" delete-char
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
export CLICOLOR=1
export EDITOR='emacs'
export PAGER='less'
export USER_NICKNAME="Rodolphe Breard"
export DEBEMAIL="packages+deb@what.tf"
export DEBFULLNAME="$USER_NICKNAME"
[[ ":$PATH:" == *":$HOME/bin:"* ]] || export PATH="$PATH:$HOME/bin"

# Colors
[ "$CLICOLOR" -ne 0 ] && hash dircolors 2>/dev/null && eval $(dircolors -b)

# Command completion
autoload -U compinit
compinit

# Prompt
if [ -f /usr/bin/liquidprompt ]; then
    unset PROMPT_COMMAND
    . /usr/bin/liquidprompt
elif [ -f "$HOME/liquidprompt/liquidprompt" ]; then
    unset PROMPT_COMMAND
    . "$HOME/liquidprompt/liquidprompt"
else
    if [ "$CLICOLOR" -ne 0 ]; then
        autoload -U colors && colors
        PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[yellow]%}%M%{$fg[red]%}->%{$reset_color%} "
    else
        PS1='%n@%M-> '
    fi
fi

# Syntax-highlighting
if [ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    . "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# GPG Agent
if [ -f "${HOME}/.gpg-agent-info" ]; then
    . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
fi
export GPG_TTY=$(tty)

# rbenv
[[ ! ":$PATH:" == *":$HOME/.rbenv/shims:"* ]] && hash rbenv 2>/dev/null && eval "$(rbenv init -)"

# Aliases
[ "$(uname -s | tr '[:upper:]' '[:lower:]')" = 'linux' ] && alias ls='ls --color=auto'
alias ll='ls -lihF'
alias la='ls -A'
alias l='ll -A'

alias sudo='sudo '
alias grep='grep -n --color=auto'
alias j='jobs'
alias ne='emacs'
alias df='df -h'
alias weechat='TERM=screen-256color weechat'
alias lock='xscreensaver-command --lock'
hash htop 2>/dev/null && alias top='TERM=screen-256color htop'
hash sqlmap 2>/dev/null && alias sqlmap='sqlmap --user-agent="Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"'
hash sqlmap 2>/dev/null && alias sqlmap-tor='sqlmap --tor --tor-type=SOCKS5'

if hash chromium 2>/dev/null; then
    chromium-tor() {
        killall chromium
        chromium --incognito --proxy-server="socks://localhost:9050"
    }
fi

if hash dig 2>/dev/null; then
istheinternetonfire() {
    txt=$(dig +short txt istheinternetonfire.com)
    if hash cowsay 2>/dev/null; then
        echo "$txt" | cowsay
    else
        echo "$txt"
    fi
}
fi

stop_censorship() {
    msg="Halte à la censure administrative du web !"
    for ip in "90.85.16.50" "90.85.16.51" "90.85.16.52"
    do
        randmsg="$msg $(base64 </dev/urandom | tr -dc 'a-zA-Z0-9' | head -c10)"
        curl -s -o /dev/null --get --data-urlencode "msg=$randmsg" -H "Host: $randmsg" --user-agent "$randmsg" --referer "$randmsg" "http://$ip/"
    done
}
