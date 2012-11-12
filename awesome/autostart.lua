-- STARTUP apps

do
	local cmds = 
	{ 
		"pyvolwheel",
		"pidgin",
		"/home/samuel/.conky/startconky.sh",
    "mpd"
	}

	for _,i in pairs(cmds) do
		awful.util.spawn(i)
	end
end
