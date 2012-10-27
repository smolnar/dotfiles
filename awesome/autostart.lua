-- STARTUP apps

do
	local cmds = 
	{ 
		"pyvolwheel",
		"pidgin",
		"thunar --daemon",
		"/home/samuel/.conky/startconky.sh",
    "wicd-client --tray"
	}

	for _,i in pairs(cmds) do
		awful.util.spawn(i)
	end
end
