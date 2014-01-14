#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if hash pulseaudio 2>/dev/null; then
    pulseaudio --start
fi
