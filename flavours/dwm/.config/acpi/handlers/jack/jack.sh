#!/bin/sh

data="${0%/*}/vol_mem.dat"

save_data() {
	var_vol="$1"
	var_status="$2"


	IFS='
	'

	set -- $(amixer sget Master | tail -1 \
		| sed 's/.*\[\(.*\)\].*\[.*\].*\[\(.*\)\]/\1\n\2/')

	sed -i "/^$var_vol=/s|.*|$var_vol=\"$1\"|" "$data"
	sed -i "/^$var_status=/s|.*|$var_status=\"$2\"|" "$data"
}

case "$1" in
	jack/headphone)
		. "$data" # source for the variables below

		case $3 in
			plug)
				logger "Headphone jack plugged"

				save_data "speaker_vol" "speaker_status"

				amixer sset Master "$jack_vol"
				amixer sset Master "$jack_status"

				pkill -RTMIN+11 dwmblocks
				;;
			unplug)
				logger "Headphone jack unplugged"

				save_data "jack_vol" "jack_status"

				amixer sset Master "$speaker_vol"
				amixer sset Master "$speaker_status"

				pkill -RTMIN+11 dwmblocks
				;;
		esac
		;;
esac
