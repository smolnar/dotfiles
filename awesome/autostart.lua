-- STARTUP apps

do
	local cmds = 
	{ 
		"gnome-screensaver",
    "gnome-settings-daemon",
    "gnome-power-manager",
    "feh  --bg-scale '/home/samuel/.config/awesome/themes/niceandclean/wallpaper-1.jpg'",
    "nm-applet",
    "pidgin",
		"/home/samuel/.conky/startconky.sh",
    "mpd"
	}

	for _,i in pairs(cmds) do
		awful.util.spawn(i)
	end
end
