[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

hash xcompmgr 2>/dev/null && xcompmgr &
hash xscreensaver 2>/dev/null && xscreensaver -no-splash &
hash gpg-agent 2>/dev/null && eval $(gpg-agent --daemon --enable-ssh-support --write-env-file "${HOME}/.gpg-agent-info")

DEFAULT_SESSION=awesome
[[ ":$PATH:" == *":$HOME/bin:"* ]] || export PATH="$PATH:$HOME/bin"

case "$1" in
    awesome|default|"")
	exec awesome
	;;
    qtile)
	exec qtile
	;;
    *) exec $DEFAULT_SESSION ;;
esac
