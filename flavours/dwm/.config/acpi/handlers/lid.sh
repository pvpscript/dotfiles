#!/bin/sh

case $1 in
	button/lid)
		case "$3" in
		    close)
			logger 'LID closed'
			;;
		    open)
			logger 'LID opened'
			;;
		    *)
			logger "ACPI action undefined: $3"
			;;
	esac
esac
