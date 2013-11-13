[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

DEFAULT_SESSION=awesome
case "$1" in
    default|awesome|"")
	[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
	xcompmgr &
	/usr/bin/xscreensaver -no-splash &
	eval $(/usr/bin/gpg-agent --daemon --enable-ssh-support --write-env-file "${HOME}/.gpg-agent-info")
	exec awesome
	;;
    weston|weston-launch)
	exec weston-launch
	;;
    *) exec $DEFAULT_SESSION ;;
esac
