#!/bin/sh

case "$1" in
	ac_adapter)
	case "$2" in
	    AC|ACAD|ADP0|ACPI0003:00)
		case "$4" in
		    00000000)
			logger 'AC unpluged'

			pkill -RTMIN+12 dwmblocks	
			;;
		    00000001)
			logger 'AC pluged'

			pkill -RTMIN+12 dwmblocks	
			;;
		esac
		;;
	    *)
		logger "ACPI action undefined: $2"
		;;
	esac
	;;
	battery)
	case "$2" in
	    BAT0)
		case "$4" in
		    00000000)
			logger 'Battery online'
			;;
		    00000001)
			logger 'Battery offline'
			;;
		esac
		;;
	    CPU0)
		;;
	    *)  logger "ACPI action undefined: $2" ;;
	esac
	;;
esac
