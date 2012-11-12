-- WIDGETS BOTTOM
-- Left
-- MPD widget
mpdwidget = widget({ type = "textbox" })
	vicious.register(mpdwidget, vicious.widgets.mpd,
		function (widget, args)
			if args["{state}"] == "Stop" then
				return "  " .. colcya .. "not playing" .. coldef .. ""
			elseif args["{state}"] == "Play" then
				return "  " .. colcya .. "playing " .. coldef .. colbwhi .. args["{Artist}"] .. " - " .. args["{Title}"] .. coldef .. ""
			elseif args["{state}"] == "Pause" then
				return "  " .. colcya .. "paused " .. coldef .. colbyel .. coldef .. ""
			end
		end, 1 )
	mpdwidget:buttons(
		awful.util.table.join(
			awful.button({}, 1, function () awful.util.spawn("mpc toggle", false) end),
			awful.button({}, 2, function () awful.util.spawn( terminal .. " -e ncmpcpp")   end),
			awful.button({modkey}, 1, function () awful.util.spawn("mpc prev", false) end),
			awful.button({modkey}, 3, function () awful.util.spawn("mpc next", false) end)
		)
	)

--plaympdwidget = wibox.widget.imagebox()
----plaympdwidget:set_image(awful.util.getdir("config") .. "/icons/play.png")
--plaympdwidget:set_image(theme.widget_mpd_play)
--stopmpdwidget:set_image(theme.widget_mpd_stop)
--pausempdwidget = wibox.widget.imagebox()
--pausempdwidget:set_image(theme.widget_mpd_pause)
--nextmpdwidget = wibox.widget.imagebox()
--nextmpdwidget:set_image(theme.widget_mpd_next)
--prevmpdwidget = wibox.widget.imagebox()
--prevmpdwidget:set_image(theme.widget_mpd_prev)
--
--plaympdwidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn("mpc play", false) end)))
--stopmpdwidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn("mpc stop", false) end)))
--pausempdwidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn("mpc pause", false) end)))
--prevmpdwidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn("mpc prev", false) end)))
--nextmpdwidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn("mpc next", false) end)))
--
--
mpdimagewidget = widget({ type = "imagebox" })
mpdimagewidget.image = image(theme.widget_mpd)
mpdimagewidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn("mpc play", false) end)))
mpdimagewidget:buttons(awful.util.table.join(awful.button({}, 3, function () awful.util.spawn("mpc stop", false) end)))

-- Right (from left to right)
-- Net widgets
-- eth
netimagewidget = widget({ type = "imagebox" })
netimagewidget.image = image(theme.widget_net)

netdownimagewidget =  widget({ type = "imagebox" })
netdownimagewidget.image = image(theme.widget_down)
netdownwidget = widget({ type = "textbox" })
	vicious.cache(vicious.widgets.net)
	vicious.register(netdownwidget, vicious.widgets.net, "" .. colcya .. " " ..coldef .. colbwhi .. "${eth0 down_kb} " .. coldef .. "")

netupimagewidget =  widget({ type = "imagebox" })
netupimagewidget.image = image(theme.widget_up)
netupwidget = widget({ type = "textbox" })
vicious.register(netupwidget, vicious.widgets.net, "" .. colcya .. " " .. coldef .. colbwhi .. "${eth0 up_kb} " .. coldef .. "")

-- make net widget invisible while net is down
netwidget = widget({ type = "textbox" })
	vicious.register(netwidget, vicious.widgets.net,
	function (widget, args)
		function ip_addr()
			local ip = io.popen("ip addr show eth0 | grep 'inet '")
			local addr = ip:read("*a")
			ip:close()
			addr = string.match(addr, "%d+.%d+.%d+.%d+")
			return addr
		end
		if ip_addr() == nil then
			return "" .. colbwhi .. "not connected" .. coldef .. " "
		else
			return "" .. colcya .. " " .. coldef .. colbwhi .. ip_addr() .. coldef .. " "
		end
	end, refresh_delay, "eth0")

-- wlan
wifidownwidget = widget({ type = "textbox" })
	vicious.register(wifidownwidget, vicious.widgets.net, "" .. colcya .. "down " .. coldef .. colbwhi .. "${wlan0 down_kb} " .. coldef .. "")

wifiupwidget = widget({ type = "textbox" })
	vicious.register(wifiupwidget, vicious.widgets.net, "" .. colcya .. "up " .. coldef .. colbwhi .. "${wlan0 up_kb} " .. coldef .. "")

wifiwidget = widget({ type = "textbox" })
	vicious.register(wifiwidget, vicious.widgets.wifi,
	function (widget, args)
		function ip_addr()
			local ip = io.popen("ip addr show wlan0 | grep 'inet '")
			local addr = ip:read("*a")
			ip:close()
			addr = string.match(addr, "%d+.%d+.%d+.%d+")
			return addr
		end
		if args["{link}"] == 0 then
			wifidownwidget.visible = false
			wifiupwidget.visible = false
			return ""
		elseif ip_addr() then
			wifidownwidget.visible = true
			wifiupwidget.visible = true
			if args["{link}"]/70*100 <= 50 then
				return "" .. colcya .. "wlan " .. coldef .. colbwhi .. ip_addr() .. coldef .. colwhi .. " on " .. coldef .. colbwhi .. args["{ssid}"] .. coldef .. colred .. " at " .. coldef .. colbred .. string.format("[%i%%]", args["{link}"]/70*100) .. coldef .. " "
			elseif args["{link}"]/70*100 > 50 and args["{link}"]/70*100 <=75 then
				return "" .. colcya .. "wlan " .. coldef .. colbwhi .. ip_addr() .. coldef .. colwhi .. " on " .. coldef .. colbwhi .. args["{ssid}"] .. coldef .. colyel .. " at " .. coldef .. colbyel .. string.format("[%i%%]", args["{link}"]/70*100) .. coldef .. " "
			else
        return "" .. colcya .. "wlan " .. coldef .. colbwhi .. ip_addr() .. coldef .. colwhi .. " on " .. coldef .. colbwhi .. args["{ssid}"] .. coldef .. colwhi .. " at " .. coldef .. colbwhi .. string.format("[%i%%]", args["{link}"]/70*100) .. coldef .. " "
			end
    else 
      return ""
		end
	end, refresh_delay, "wlan0" )

-- CPU widget
cpuimagewidget = widget({ type = "imagebox" })
cpuimagewidget.image = image(theme.widget_cpu)
cpuwidget = widget({ type = "textbox" })
vicious.register(cpuwidget, vicious.widgets.cpu,
	function (widget, args)
		if  args[1] >= 50 and args[1] <= 75 then
			return "   " .. colyel ..  coldef .. colbyel .. args[1] .. "% " .. coldef .. ""
		elseif args[1] > 75 then
			return "   " .. colred .. coldef .. colbred .. args[1] .. "% " .. coldef .. ""
		else
			return "   " .. colcya .. coldef .. colbwhi .. args[1] .. "% " .. coldef .. ""
		end
	end )
cpuwidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn ( terminal .. " -e htop --sort-key PERCENT_CPU") end ) ) )

-- CPU graph and temp
cpugraph  = awful.widget.graph()
cpugraph:set_width(40):set_height(17)
cpugraph:set_background_color("#222222")
cpugraph:set_color("#0077BB")
--cpugraph:set_gradient_angle(0):set_gradient_colors({
 --"#FF5656", "#88A175", "#AECF96"
--}) 
--tempcpuwidget = awful.widget.textbox()
-- Register widgets
vicious.register(cpugraph,  vicious.widgets.cpu,      "$1")
--vicious.register(tempcpuwidget, vicious.widgets.thermal, "  $1 °C", 19, "thermal_zone0")
 -- CPU temp widget
 tempwidget = widget({ type = "textbox" })
 vicious.register(tempwidget, vicious.widgets.thermal,
 	function (widget, args)
 		if  args[1] >= 65 and args[1] < 75 then
 			return "" .. colyel .. "   " .. coldef .. colbyel .. args[1] .. "°C " .. coldef .. ""
 		elseif args[1] >= 75 and args[1] < 80 then
 			return "" .. colred .. "   " .. coldef .. colbred .. args[1] .. "°C " .. coldef .. ""
 		elseif args[1] > 80 then
 			naughty.notify({ title = "Temperature Warning", text = "Running hot! " .. args[1] .. "°C!\nTake it easy.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
 			return "" .. colred .. "   " .. coldef .. colbred .. args[1] .. "°C " .. coldef .. "" 
 		else
 			return "" .. colcya .. "   " .. coldef .. colbwhi .. args[1] .. "°C " .. coldef .. ""
 		end
 	end, 1, "thermal_zone0" )

-- Ram widget
ramimagewidget = widget({ type = "imagebox" })
ramimagewidget.image = image(theme.widget_ram)
memwidget = widget({ type = "textbox" })
	vicious.cache(vicious.widgets.mem)
	vicious.register(memwidget, vicious.widgets.mem, "   " .. colcya ..  coldef .. colbwhi .. "$1% ($2 MiB) " .. coldef .. "", 2)

-- Filesystem widgets
-- root
fsrimagewidget = widget({ type = "imagebox" })
fsrimagewidget.image = image(theme.widget_disk)
fsrwidget = widget({ type = "textbox" })
	vicious.register(fsrwidget, vicious.widgets.fs,
	function (widget, args)
		if  args["{/ used_p}"] >= 93 and args["{/ used_p}"] < 97 then
			return "" .. colyel .. "root " .. coldef .. colbyel .. args["{/ used_p}"] .. "% used (" .. args["{/ avail_gb}"] .. " GiB free) " .. coldef .. ""
		elseif args["{/ used_p}"] >= 97 and args["{/ used_p}"] < 99 then
			return "" .. colred .. "root " .. coldef .. colbred .. args["{/ used_p}"] .. "% used (" .. args["{/ avail_gb}"] .. " GiB free) " .. coldef .. ""
		elseif args["{/ used_p}"] >= 99 and args["{/ used_p}"] <= 100 then
			naughty.notify({ title = "Hard drive Warning", text = "No space left on root!\nMake some room.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
			return "" .. colred .. "root " .. coldef .. colbred .. args["{/ used_p}"] .. "% used (" .. args["{/ avail_gb}"] .. " GiB free) " .. coldef .. "" 
		else
			return "" .. colcya .. "root " .. coldef .. colbwhi .. args["{/ used_p}"] .. "% used (" .. args["{/ avail_gb}"] .. " GiB free) " .. coldef .. ""
		end
	end, 621)

-- /home
--
fshimagewidget = widget({ type = "imagebox" })
fshimagewidget.image = image(theme.widget_fs2)
fshwidget = widget({ type = "textbox" })
	vicious.register(fshwidget, vicious.widgets.fs,
	function (widget, args)
		if  args["{/home used_p}"] >= 97 and args["{/home used_p}"] < 98 then
			return "" .. colyel .. "home " .. coldef .. colbyel .. args["{/home used_p}"] .. "% used (" .. args["{/home avail_gb}"] .. " GiB free) " .. coldef .. ""
		elseif args["{/home used_p}"] >= 98 and args["{/home used_p}"] < 99 then
			return "" .. colred .. "home " .. coldef .. colbred .. args["{/home used_p}"] .. "% used (" .. args["{/home avail_gb}"] .. " GiB free) " .. coldef .. ""
		elseif args["{/home used_p}"] >= 99 and args["{/home used_p}"] <= 100 then
			naughty.notify({ title = "Hard drive Warning", text = "No space left on /home!\nMake some room.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
			return "" .. colred .. "home " .. coldef .. colbred .. args["{/home used_p}"] .. "% used (" .. args["{/home avail_gb}"] .. " GiB free) " .. coldef .. "" 
		else
			return "" .. colcya .. "home " .. coldef .. colbwhi .. args["{/home used_p}"] .. "% used (" .. args["{/home avail_gb}"] .. " GiB free) " .. coldef .. ""
		end
	end, 622)

-- Battery widget
batimagewidget = widget({ type = "imagebox" })
batimagewidget.image = image(theme.widget_ac)
batwidget = widget({ type = "textbox"} )
vicious.register(batwidget, vicious.widgets.bat,
	function (widget, args)
		if args[2] >= 50 and args[2] < 100 and args[1] == "-" then
			batimagewidget.image = image(theme.widget_batfull)
			return "" .. colyel .. "   " .. coldef .. colwhi .. args[2] .. "% " .. coldef .. ""
		elseif args[2] >= 20 and args[2] < 50 and args[1] == "-" then
			batimagewidget.image = image(theme.widget_batfull)
			return "" .. colyel .. "   " .. coldef .. colbyel ..  args[2] .. "% " .. coldef .. ""

		elseif args[2] >= 10 and args[2] < 20 and args[1] == "-" then
			batimagewidget.image = image(theme.widget_batmed)
			return "" .. colred .. "   " .. coldef .. colbred  .. args[2] .. "% " .. coldef .. ""
		elseif args[2] < 10 and args[1] == "-" then
			naughty.notify({ title = "Battery Warning", text = "Battery low! "..args[2].."% left!\nBetter get some power.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
			batimagewidget.image = image(theme.widget_batlow)
			return "" .. colred .. "   " .. coldef .. colbred .. args[2] .. "% " .. coldef .. ""
		elseif args[2] < 10 then 
			batimagewidget.image = image(theme.widget_batempty)
			return "" .. colred .. "   " .. coldef .. colbred .. args[2] .. "% " .. coldef .. ""
		else
			batimagewidget.image = image(theme.widget_ac)
			return "" .. colcya .. "   " .. coldef .. colbwhi .. args[2] .. "% " .. coldef .. ""
		end
	end, 60, "BAT0" )

-- Volume widget
volimagewidget = widget({ type = "imagebox" })
volimagewidget.image = image(theme.widget_vol)
volwidget = widget({ type = "textbox" })
	vicious.register(volwidget, vicious.widgets.volume,
		function (widget, args)
			if args[1] == 0 or args[2] == "♩" then
				volimagewidget.image = image(theme.widget_mute)
				return "" .. colcya .. "   " .. coldef .. colbred .. "0 %" .. coldef .. "" 
			else
				volimagewidget.image = image(theme.widget_vol)
				return "" .. colcya .. "   " .. coldef .. colbwhi .. args[1] .. "% " .. coldef .. ""
			end
		end, 0.5, "Master" )
	volwidget:buttons(
		awful.util.table.join(
			awful.button({ }, 1, function () awful.util.spawn("amixer -q sset Master toggle")   end),
			awful.button({ }, 3, function () awful.util.spawn( terminal .. " -e alsamixer")   end),
			awful.button({ }, 4, function () awful.util.spawn("amixer -q sset Master 2dB+") end),
			awful.button({ }, 5, function () awful.util.spawn("amixer -q sset Master 2dB-") end)
		)
	)
