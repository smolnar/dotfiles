-- CREATION
-- WIBOX
mywibox = {}
infobox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mylauncher = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({        }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({        }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({        }, 4, awful.tag.viewnext),
                    awful.button({        }, 5, awful.tag.viewprev)
                    )
shifty.taglist = mytaglist




mytasklist = {}
mytasklist.buttons = awful.util.table.join(
	awful.button({ }, 1, function (c)
		if c == client.focus then
			c.minimized = true
		else
			if not c:isvisible() then
				awful.tag.viewonly(c:tags()[1])
			end
			-- This will also un-minimize the client, if needed
			client.focus = c
			c:raise()
		end
	end),
	awful.button({ }, 3, function ()
		if instance then
			instance:hide()
			instance = nil
		else
			instance = awful.menu.clients({ width=250 })
		end
	end),
	awful.button({ }, 4, function ()
		awful.client.focus.byidx(1)
		if client.focus then client.focus:raise() end
	end),
	awful.button({ }, 5, function ()
		awful.client.focus.byidx(-1)
		if client.focus then client.focus:raise() end
	end))

-- Separator
separator = wibox.widget.textbox() 
separator:set_markup(" :: ")

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Create for each screen ...
for s = 1, screen.count() do
	-- a promptbox
	mypromptbox[s] = awful.widget.prompt()
	-- a taglist widget
	mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)
	-- a tasklist widget
	mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)
	-- layout box !	
	mylayoutbox[s] = awful.widget.layoutbox(s)
    	mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
	-- create wiboxes
	-- top
	mywibox[s] = awful.wibox({ position = "top", height = "14", screen = s })
		-- widgets left
		local left_layout = wibox.layout.fixed.horizontal()
			left_layout:add(mylauncher)
			left_layout:add(mytaglist[s])
			left_layout:add(mypromptbox[s])
		-- widgets right
		local right_layout = wibox.layout.fixed.horizontal()
		right_layout:add(kbdcfg.widget)
		right_layout:add(separator)
		right_layout:add(wibox.widget.systray()) 
		right_layout:add(separator)
		right_layout:add(weatherwidget)
		right_layout:add(separator)
		right_layout:add(calwidget)
		right_layout:add(separator)
		right_layout:add(clockwidget)
		right_layout:add(mylayoutbox[s])
	-- combine above elements
	local layout = wibox.layout.align.horizontal()
		layout:set_left(left_layout)
		layout:set_middle(mytasklist[s])
		layout:set_right(right_layout)
	mywibox[s]:set_widget(layout)
	-- bottom
	infobox[s] = awful.wibox({ position = "bottom", height = "14", screen = s })
		-- widgets left
		local left_layout = wibox.layout.fixed.horizontal()
			left_layout:add(mpdimagewidget)
			left_layout:add(mpdwidget)
			
		-- widgets right
		local right_layout = wibox.layout.fixed.horizontal()
			right_layout:add(netdownimagewidget)
			right_layout:add(netdownwidget)
			right_layout:add(netupimagewidget)
			right_layout:add(netupwidget)
			right_layout:add(netimagewidget)
			right_layout:add(netwidget)
--			right_layout:add(wifidownwidget)
			right_layout:add(separator)
--			right_layout:add(wifiupwidget)
			right_layout:add(wifiwidget)
			right_layout:add(cpuimagewidget)
			right_layout:add(cpugraph)
			right_layout:add(cpuwidget)
			right_layout:add(tempwidget)
			right_layout:add(separator)
--			right_layout:add(tempwidget)
			right_layout:add(ramimagewidget)
			right_layout:add(memwidget)
			right_layout:add(separator)
			right_layout:add(fsrimagewidget)
			right_layout:add(fsrwidget)
			right_layout:add(separator)
			right_layout:add(fsrimagewidget)
			right_layout:add(fshwidget)
			right_layout:add(separator)
			right_layout:add(batimagewidget)
			right_layout:add(batwidget)
			right_layout:add(separator)
			right_layout:add(volimagewidget)
			right_layout:add(volwidget)
	-- combine above elements
	local layout = wibox.layout.align.horizontal()
		layout:set_left(left_layout)
		layout:set_right(right_layout)
	infobox[s]:set_widget(layout)
end
