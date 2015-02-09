#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

hash pulseaudio 2>/dev/null && pulseaudio --start
