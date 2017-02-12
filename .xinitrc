[ -f ~/.xprofile ] && . ~/.xprofile
[ -f ~/.setpath.sh ] && . ~/.setpath.sh

DEFAULT_SESSION=qtile

case "$1" in
    awesome)
	exec awesome
	;;
    qtile)
	exec qtile 2>/tmp/qtile.err.log
	;;
    *) exec $DEFAULT_SESSION ;;
esac
