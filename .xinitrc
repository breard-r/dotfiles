[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
/usr/bin/xcompmgr &
/usr/bin/xscreensaver -no-splash &
eval $(/usr/bin/gpg-agent --daemon --enable-ssh-support --write-env-file "${HOME}/.gpg-agent-info")

DEFAULT_SESSION=awesome
case "$1" in
    default|awesome|"")
	exec awesome
	;;
    qtile)
	exec qtile
	;;
    *) exec $DEFAULT_SESSION ;;
esac
