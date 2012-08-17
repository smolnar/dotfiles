#!/bin/bash
#############################################
#
# A script used by xinit to start a session.
#
#
#
#
#
##############################################

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export DE=gnome
export BROWSER=firefox

# cursor fix
xsetroot -cursor_name arrow &

#case $1 in
#"opnbx")
#	exec ck-launch-session openbox-session
#	;;
#"xfce4")
#	exec ck-launch-session startxfce4
#	;;
#"awesome")
#	exec ck-launch-session awesome 
#	;;
#*)
#	exec ck-launch-session awesome  
#	;;
#esac

exec ck-launch-session dbus-launch awesome 
