XDG_USER_DIR_FILE="$HOME/.config/user-dirs.dirs"

if [ -f "$XDG_USER_DIR_FILE" ]; then
    . "$XDG_USER_DIR_FILE"
    export XDG_PICTURES_DIR="$XDG_PICTURES_DIR"
fi
