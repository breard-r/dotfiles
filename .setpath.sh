add_path() {
    BIN_PATH="$1"
    if [ -d "$BIN_PATH" ]; then
        found=$(echo $PATH | tr ':' '\n' | grep -w "$BIN_PATH")
        [ ! "$found" ] && export PATH="$BIN_PATH:$PATH"
        true
    fi
}

add_path "$HOME/.local/bin"
add_path "$HOME/.cargo/bin"
