alias sudo='sudo '

if [ "$OS_TYPE" == "freebsd" ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
alias ll='ls -lih'
alias la='ls -A'
alias l='ls -lihA'

alias grep='grep -n --color=auto'
alias j='jobs'
alias ne='emacs'
alias df='df -h'
alias top='TERM=screen-256color htop'
alias weechat='TERM=screen-256color weechat'

alias lock='xscreensaver-command --lock'

alias meteo='curl -s --user-agent "USER FUCKING AGENT" "http://thefuckingweather.com/?where=Paris" | grep "<p class=\"remark\">" | sed -r "s/.*>(.*)<.*/\1 OUTSIDE\!/g"'

fliptable() { echo "（╯°□°）╯ ┻━┻"; }

# Usage: venv project_name
# Activate the python virtualenv for <project_name>.
venv()
{
    if [ -f "${HOME}/venvs/$1/bin/activate" ]; then
	. "${HOME}/venvs/$1/bin/activate"
    fi
}
