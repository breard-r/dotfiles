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
[ "$(uname -s | tr '[:upper:]' '[:lower:]')" = 'linux' ] && alias ls='ls --color=auto'
alias ll='ls -lihF'
alias la='ls -A'
alias l='ll -A'

alias t='tree'
alias sudo='sudo '
alias grep='grep -n --color=auto'
alias j='jobs'
alias df='df -h'
alias du='du -ch'
hash htop 2>/dev/null && alias top='htop'
hash xscreensaver-command 2>/dev/null && alias lock='xscreensaver-command --lock'
hash sqlmap 2>/dev/null && alias sqlmap='sqlmap --user-agent="Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"'
hash sqlmap 2>/dev/null && alias sqlmap-tor='sqlmap --tor --tor-type=SOCKS5'
hash steam 2>/dev/null && alias steam='find ~/.steam/root/ \( -name "libgcc_s.so*" -o -name "libstdc++.so*" -o -name "libxcb.so*" \) -print -delete; steam'

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

clean()
{
    clean_dir()
    {
        local dir="$1"
        if [ -d "$dir" ]; then
            find "$dir" -name "*~" -print -delete
            find "$dir" -name ".*~" -print -delete
            find "$dir" -name "#*#" -print -delete
        else
            echo "$dir: not a directory" >&2
        fi
    }

    if [ $# -ne 0 ]; then
        for dir in "$@"; do
            clean_dir "$dir"
        done
    else
        clean_dir "./"
    fi

    unfunction clean_dir
}
