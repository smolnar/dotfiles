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
separator = widget({ type = "textbox" })
separator.text = " :: "

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Create for each screen ...
for s = 1, screen.count() do
	-- a promptbox
	mypromptbox[s] = awful.widget.prompt()
	-- a taglist widget
	mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)
    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)
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
	mywibox[s].widgets = {
    {   
      mylauncher,
      mytaglist[s],
      mypromptbox[s],
      layout = awful.widget.layout.horizontal.leftright
     },
     
     mylayoutbox[s],
     separator,
     clockwidget,
     separator,
     calwidget,
     separator,
     weatherwidget,
     separator,
     widget({ type = "systray" }),
     separator,
     kbdcfg.widget,
     layout = awful.widget.layout.horizontal.rightleft
  }
  
  
	-- bottom
	infobox[s] = awful.wibox({ position = "bottom", height = "14", screen = s })
  infobox[s].widgets = {
    {
      mpdimagewidget,
      mpdwidget,
      layout = awful.widget.layout.horizontal.leftright
    },

    volwidget,
    volimagewidget,
    separator,
    batwidget,
    batimagewidget,
    separator,
    fshwidget,
    fsrimagewidget,
    separator,
    fsrwidget,
    fsrimagewidget,
    separator,
    memwidget,
    ramimagewidget,
    separator,
    tempwidget,
    cpuwidget,
    cpugraph,
    cpuimagewidget,
    wifiwidget,
    separator,
    netwidget,
    netimagewidget,
    netupwidget,
    netupimagewidget,
    netdownwidget,
    netdownimagewidget,
    layout = awful.widget.layout.horizontal.rightleft
  }
end
