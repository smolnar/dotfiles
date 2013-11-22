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
export BROWSER=google-chrome

# fix for new locale support in archlinux
export LANG="en_US.utf-8"

# cursor fix
#xsetroot -cursor_name arrow &

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

gnome-settings-daemon &
sleep 2
gnome-screensaver &
gnome-sound-applet &
nm-applet &
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)

export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

mpd & 
dropbox start &
xmodmap ~/.xmodmaprc &

exec awesome 
