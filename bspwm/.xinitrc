#!/bin/sh

case $1 in
bspwm)

	# Set colors, cursor, font, and display settings
#	Laptop settings:
#	synclient HorizEdgeScroll=1
#	synclient HorizTwoFingerScroll=1
#	synclient VertEdgeScroll=1
	xsetroot -cursor_name left_ptr
	xrdb $HOME/.Xresources
	#xset r rate 250 30
	#xset +fp /usr/share/fonts/local
	#xset fp rehash
	#xset s off off
	#xset dpms 1200 1800 2400
#	Laptop settings:
#	xset dpms 300 300 300

	# Startup programs
#	sleep 10 && dropboxd &
#	pulseaudio --start -D
#	pasystray &
#	nm-applet &
#	urxvtd -q -o -f
#	unclutter -root &
#	nitrogen --restore &
#	compton &
	sxhkd &

	# Prepare BAR
	export PANEL_FIFO=/tmp/bspwm-fifo
	[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
	mkfifo "$PANEL_FIFO"
#	For optional conky output; see my conky_wunderground_scripts repo
#	$HOME/git/conky_wunderground_scripts/runner_wunderground_min.sh &
	xtitle -sf 'T%s' > "$PANEL_FIFO" &
	conky -c $HOME/.config/bspwm/conkyrc_bar > "$PANEL_FIFO" &
	cat "$PANEL_FIFO" | $HOME/.config/bspwm/panel_bar | bar &
	trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 4 --transparent true --alpha 0 --tint 0x1C1C1C --height 18 &
#	Laptop setting:
#	trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 6 --transparent true --alpha 0 --tint 0x1C1C1C --height 18 &

	# Launch bspwm
	exec bspwm -s "$PANEL_FIFO" -p W -c $HOME/.config/bspwm/bspwmrc
	;;
*)
	exec $1
	;;
esac
