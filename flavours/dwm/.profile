# Adds ~/.local/bin to the PATH
export PATH="$PATH:$(find ~/.local/bin -depth -type d | tr '\n' ':' | sed 's/:*$//')"

# XDG definitions
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
#export BROWSER=""
export READER="zathura"
export STATUSBAR="dwmblocks"

# terminal title
export PROMPT_COMMAND='printf "\033]0;$TERMINAL - \"$(basename "$PWD")\"\007"'

# Show special characters in raw form for 'less'
export LESS=-R

# LESS_TERMCAP definitions (POSIX compliant)
export LESS_TERMCAP_mb="$(printf '%b' '\e[1;31m')" # red fg
export LESS_TERMCAP_md="$(printf '%b' '\e[1;36m')" # cyan fg
export LESS_TERMCAP_me="$(printf '%b' '\e[0m')"
export LESS_TERMCAP_so="$(printf '%b' '\e[01;44;33m')" # yellow bg, blue fg
export LESS_TERMCAP_se="$(printf '%b' '\e[0m')"
export LESS_TERMCAP_us="$(printf '%b' '\e[4m\e[1;32m')" # underline, green
export LESS_TERMCAP_ue="$(printf '%b' '\e[0m')"

# Other configs
export SUDO_ASKPASS="$HOME/.local/bin/dmenu/dmenu-pass"

# acpid configs
export ACPID_CONFIG="$XDG_CONFIG_HOME/acpi/events"
export ACPID_SOCKET="$XDG_CONFIG_HOME/acpi/run/acpid.socket"
export ACPID_PID="$XDG_CONFIG_HOME/acpi/run/acpid.pid"

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
