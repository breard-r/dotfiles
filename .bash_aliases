alias sudo='sudo '

if [ "$OS_TYPE" == "freebsd" ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
alias ll='ls -lih'
alias la='ls -A'
alias l='ls -lihA'

alias grep='grep -nH --color=auto'
alias j='jobs'
alias ne='emacs'
alias df='df -h'
alias top='TERM=screen-256color htop'
alias weechat='TERM=screen-256color weechat'

alias lock='xscreensaver-command --lock'

alias meteo='curl -s --user-agent "USER FUCKING AGENT" "http://thefuckingweather.com/?where=Paris" | grep "<p class=\"remark\">" | sed -r "s/.*>(.*)<.*/\1 OUTSIDE\!/g"'

alias ryzom_season_change='date --date $(wget -q -O - "http://api.ryzom.com/time.php?format=xml" | sed "s/></>\n</g" | /bin/grep -e "day_of_season" -e "time_of_day" | sed "s/<day_of_season>/\(89-/" | sed "s/<time_of_day>/\(23-/g" | sed "s/<\/day_of_season>/\)\*72/" | sed "s/<\/time_of_day>/\)\*3/" | bc | tr "\n" "+" | sed "s/\+$/\n\"min\"\n/" | bc | tr -d "\n")'

fliptable() { echo "（╯°□°）╯ ┻━┻"; }

# Usage: venv project_name
# Activate the python virtualenv for <project_name>.
venv()
{
    if [ -f "${HOME}/venvs/$1/bin/activate" ]; then
	. "${HOME}/venvs/$1/bin/activate"
    fi
}
