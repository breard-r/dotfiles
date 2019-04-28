# Since all keyboards does not include the same keys, the compose key
# should be customized. In order to achieve that, this script requires
# a symbolic link to point to a file containing the name of the key that
# will be used as a compose key.

COMPOSE_KEY_FILE="$HOME/.compose_key"

if [ -f "$COMPOSE_KEY_FILE" ]; then
    COMPOSE_KEY=$(cat "$COMPOSE_KEY_FILE")
    setxkbmap -option "compose:$COMPOSE_KEY"
fi
