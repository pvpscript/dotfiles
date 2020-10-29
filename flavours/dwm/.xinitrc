#!/bin/sh

[ -f ~/.xprofile ] && . ~/.xprofile

while true; do
	dwm 2> ~/.dwm.log
done
# exec dwm
