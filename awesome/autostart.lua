-- STARTUP apps

do
	local cmds = 
	{ 
    "pidgin",
		"/home/samuel/.conky/startconky.sh",
	}

	for _,i in pairs(cmds) do
		awful.util.spawn(i)
	end
end
