[ -f ~/.xprofile ] && . ~/.xprofile
[ -f ~/.setpath.sh ] && . ~/.setpath.sh

AUTHORISED_WM="qtile i3"
AVAILABLE_WM=""
REQUESTED_WM="$1"

for wm in $AUTHORISED_WM; do
    if hash "$wm" 2>/dev/null; then
        if [ "$AVAILABLE_WM" ]; then
            AVAILABLE_WM="$AVAILABLE_WM $wm"
        else
            AVAILABLE_WM="$wm"
        fi
    fi
done
if [ ! "$AVAILABLE_WM" ]; then
    >&2 echo "Error: No window manager found. Please install one of the following:"
    >&2 echo "$AUTHORISED_WM"
    exit 1
fi

WM=$(echo "$AVAILABLE_WM" | tr ' ' '\n' | head -n1)
if [ "$REQUESTED_WM" ]; then
    found=$(echo "$AVAILABLE_WM" | tr ' ' '\n' | grep -w "$REQUESTED_WM")
    if [ "$found" ]; then
        WM="$found"
    else
        >&2 echo "Warning: $REQUESTED_WM not found, starting the default window manager."
    fi
fi

exec "$WM" 2>/tmp/xinit.err.log
