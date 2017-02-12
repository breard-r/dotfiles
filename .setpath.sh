BIN_PATH="$HOME/bin"
if [ -d "$BIN_PATH" ]; then
    found=$(echo $PATH | tr ':' '\n' | grep -w "$BIN_PATH")
    [ ! "$found" ] && export PATH="$BIN_PATH:$PATH"
    true
fi
