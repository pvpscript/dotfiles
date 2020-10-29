#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

PS1='[\u@\h \W]\$ '
