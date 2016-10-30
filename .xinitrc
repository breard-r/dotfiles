[ -f ~/.xprofile ] && . ~/.xprofile

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
