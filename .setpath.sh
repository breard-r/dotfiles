BIN_PATH="$HOME/bin"
found=$(echo $PATH | tr ':' '\n' | grep -w "$BIN_PATH")
[ ! "$found" ] && export PATH="$BIN_PATH:$PATH"
true
