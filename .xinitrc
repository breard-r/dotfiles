[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

hash xcompmgr 2>/dev/null && xcompmgr &
hash xscreensaver 2>/dev/null && xscreensaver -no-splash &
hash gpg-agent 2>/dev/null && eval $(gpg-agent --daemon --enable-ssh-support)

DEFAULT_SESSION=qtile
[[ ":$PATH:" == *":$HOME/bin:"* ]] || export PATH="$HOME/bin:$PATH"

case "$1" in
    awesome)
	exec awesome
	;;
    qtile)
	exec qtile 2>/tmp/qtile.err.log
	;;
    *) exec $DEFAULT_SESSION ;;
esac
