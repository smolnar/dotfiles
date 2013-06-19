require("awful")
require("awful.autofocus")
require("awful.rules")
require("beautiful")
require("naughty")
require("vicious")
require('markdown')

--{{---| Java GUI's fix |---------------------------------------------------------------------------

awful.util.spawn_with_shell("wmname LG3D")

--{{---| Error handling |---------------------------------------------------------------------------

if awesome.startup_errors then
  naughty.notify({ 
    preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors 
  })
end
do
  local in_error = false
  awesome.add_signal("debug::error", function (err)
    if in_error then return end
    in_error = true
    naughty.notify({ 
      preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = err 
    })
    in_error = false
  end)
end

--{{---| Theme |------------------------------------------------------------------------------------

config_dir = ("/home/samuel/.config/awesome")
themes_dir = (config_dir .. "/themes")
beautiful.init(themes_dir .. "/powerarrow/theme.lua")

--{{---| Variables |--------------------------------------------------------------------------------

modkey        = "Mod4"
terminal      = "gnome-terminal"
editor        = os.getenv("EDITOR") or "vim"
editor_cmd    = terminal .. " -e " .. editor
browser       = "google-chrome"
modkey        = "Mod4"
altkey        = "Mod1"
main          = browser .. " www.gmail.com"
musicplr      = terminal .. " -e ncmpcpp"

--{{---| Table of layouts |-------------------------------------------------------------------------

layouts =
{
  awful.layout.suit.floating,
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.top
}

--{{---| Naughty theme |----------------------------------------------------------------------------

naughty.config.default_preset.font         = beautiful.notify_font
naughty.config.default_preset.fg           = beautiful.notify_fg
naughty.config.default_preset.bg           = beautiful.notify_bg
naughty.config.presets.normal.border_color = beautiful.notify_border
naughty.config.presets.normal.opacity      = 0.8
naughty.config.presets.low.opacity         = 0.8
naughty.config.presets.critical.opacity    = 0.8

--{{---| Tags |-------------------------------------------------------------------------------------

tags = {}
for s = 1, screen.count() do
    tags[s] = awful.tag({ 1, 2, 3, 4, 5,  "⌥", "⌤", "⌘"  }, s, { layouts[2], layouts[2], layouts[2], layouts[2], layouts[2], layouts[1], layouts[1], layouts[1] })
    --tags[s] = awful.tag({ "➊", "➋", "➌", "➍", "➎", "➏", "➐", "➑", "➒"  }, s, layouts[2])
end

--{{---| Menu |-------------------------------------------------------------------------------------

myawesomemenu = {
  {"edit config",           terminal .. "-e vim /home/rom/.config/awesome/rc.lua"},
  {"edit theme",            terminal .. "vim " .. themes_dir .. "/powerarrow/theme.lua"},
  {"hibernate",             "sudo pm-hibernate"},
  {"restart",               awesome.restart },
  {"reboot",                "sudo reboot"},
  {"quit",                  awesome.quit }
}

mydevmenu = {
  {" Android SDK Updater",  "android"},
  {" Eclipse",              "eclipse"},
  {" Emacs",                "emacs"},
  --{" IntellijIDEA",         "/home/rom/Tools/idea-IU-123.72/bin/idea.sh"},
  {" Meld",                 "meld"},
  {" pgAdmin",              "pgadmin3"},
  {" Qt Creator",           "qtcreator"}
--[[  {" RubyMine",             "/home/rom/Tools/rubymine.run"},]]
  --{" SublimeText",          "sublime_text"},
  --[[{" Tkdiff",               "tkdiff"}]]
}

mygraphicsmenu = {
  {" Character Map",        "gucharmap"},
  {" Fonty Python",         "fontypython"},
  {" gcolor2",              "gcolor2"},
  {" Gpick",                "gpick"},
  {" Gimp",                 "gimp"},
  {" Inkscape",             "inkscape"},
  {" recordMyDesktop",      "gtk-recordMyDesktop"},
  {" Screengrab",           "screengrab"},
  {" Xmag",                 "xmag"},
}

mymultimediamenu = {
  {" Audacious",            "audacious"},
  {" DeadBeef",             "deadbeef"},
  {" UMPlayer",             "umplayer"},
  {" VLC",                  "vlc"}
}

myofficemenu = {
  {" Leafpad",              "leafpad"},
  {" LibreOffice Base",     "libreoffice --base"},
  {" LibreOffice Calc",     "libreoffice --calc"},
  {" LibreOffice Draw",     "libreoffice --draw"},
  {" LibreOffice Impress",  "libreoffice --impress"},
  {" LibreOffice Math",     "libreoffice --math"},	
  {" LibreOffice Writer",   "libreoffice --writer"},
  {" Qpdfview",             "qpdfview"},
  {" ScanTailor",           "scantailor"},
  {" Sigil",                "sigil"}, 
  {" TeXworks",             "texworks"}
}

mywebmenu = {
  {" Chromium",             "chromium-browser"},
  {" Google Chrome",        "chromium-browser"},
  {" Droppox",              "dropbox"},
  {" Dwb",                  "dwb"},
  {" Filezilla",            "filezilla"},
  {" Firefox",              "firefox"},
  {" Gajim",                "gajim"},
  {" Pidgin",               "pidgin"},
  {" Skype",                "skype"},
  {" Thunderbird",          "thunderbird"}
}

mysettingsmenu = {
  {" CUPS Settings",        "sudo system-config-printer"},
  {" JDK6 Settings",        "/opt/sun-jdk-1.6.0.37/bin/ControlPanel"},
  {" JDK7 Settings",        "/opt/oracle-jdk-bin-1.7.0.9/bin/ControlPanel"},
  {" Nvidia Settings",      "sudo nvidia-settings"},
  {" Qt Configuration",     "qtconfig"}
}

mytoolsmenu = {
  {" Gparted",              "sudo gparted"},
  {" VirtualBox",           "VirtualBox"},
  {" Xfburn",               "xfburn"}
}

mymainmenu = awful.menu({ items = { 
  { " @wesome",             myawesomemenu },
  {" development",          mydevmenu},
  {" multimedia",           mymultimediamenu},	    
  {" office",               myofficemenu},
  {" tools",                mytoolsmenu},
  {" web",                  mywebmenu},
  {" settings",             mysettingsmenu},
  {" calc",                 "/usr/bin/gcalctool"},
  {" sound",                "qasmixer"},
  {" root terminal",        "sudo " .. terminal},
  {" terminal",             terminal} 
}
})

mylauncher = awful.widget.launcher({ image = image(beautiful.clear_icon), menu = mymainmenu })

--{{---| Wibox |------------------------------------------------------------------------------------

mysystray = widget({ type = "systray" })
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                 client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=450 })
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
for s = 1, screen.count() do
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

--{{---| Mail widget |------------------------------------------------------------------------------

mailicon = widget ({type = "imagebox" })
mailicon.image = image(beautiful.widget_mail)
mailicon:buttons(awful.util.table.join(awful.button({ }, 1, 
function () awful.util.spawn_with_shell(mail) end)))

--{{---| Music widget |-----------------------------------------------------------------------------

music = widget ({type = "imagebox" })
music.image = image(beautiful.widget_music)
music:buttons(
  awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn("amixer -q sset Master toggle")   end),
  awful.button({ }, 3, function () awful.util.spawn( terminal .. " -e alsamixer")   end),
  awful.button({ }, 4, function () awful.util.spawn("amixer -q sset Master 2dB+") end),
  awful.button({ }, 5, function () awful.util.spawn("amixer -q sset Master 2dB-") end)
  )
)

mpdwidget = widget({ type = "textbox" })
vicious.register(mpdwidget, vicious.widgets.mpd,
function (widget, args)
  if args["{state}"] == "Stop" then
    state = ""
  elseif args["{state}"] == "Play" then
    if (args["{Artist}"]:len() + args["{Title}"]:len()) > 20 then
      state = args["{Artist}"] .. " ..."
    else
      state = args["{Artist}"] .. " - " .. args["{Title}"]
    end
  elseif args["{state}"] == "Pause" then
    state = "paused"
  end

  if state then
    return span_container(theme.init_color) .. span('#FFFFFF') .. state .. spandef .. spandef
  end
end, 1 )

  --{{---| TaskWarrior widget |-----------------------------------------------------------------------

--[[task_warrior = blingbling.task_warrior.new(beautiful.widget_task)]]
--task_warrior:set_task_done_icon(beautiful.task_done_icon)
--task_warrior:set_task_icon(beautiful.task_icon)
--task_warrior:set_project_icon(beautiful.project_icon)

--{{---| MEM widget |-------------------------------------------------------------------------------

memwidget = widget({ type = "textbox" })
vicious.register(memwidget, vicious.widgets.mem, span_container(theme.color[1]) ..  span("#EEEEEE", theme.color[1]) ..  "$2MB" .. spandef .. spandef, 13)
memicon = widget ({type = "imagebox" })
memicon.image = image(beautiful.widget_mem)

--{{---| CPU / sensors widget |---------------------------------------------------------------------

cpuwidget = widget({ type = "textbox" })
vicious.register(cpuwidget, vicious.widgets.cpu,
span_container(theme.color[2]) .. span("#DDDDDD") .. "$2%" .. span("#888888") .. "·" .. spandef .. " $3% " .. spandef .. spandef, 3)
cpuicon = widget ({type = "imagebox" })
cpuicon.image = image(beautiful.widget_cpu)
tempwidget = widget({ type = "textbox" })
vicious.register(tempwidget, vicious.widgets.thermal,
function (widget, args)
  return span_container(theme.color[3]) .. span("#DDDDDD") .. args[1] .. "°C " .. spandef .. spandef
end, 1, "thermal_zone0" )
tempicon = widget ({type = "imagebox" })
tempicon.image = image(beautiful.widget_temp)

--{{---| FS's widget / udisks-glue menu |-----------------------------------------------------------
--
fswidgeticon = widget({ type = "imagebox" })
fswidgeticon.image = image(beautiful.widget_hdd)
fswidget = widget({ type = "textbox" })
vicious.register(fswidget, vicious.widgets.fs,
function (widget, args)
  return span_container(theme.color[4]) .. span("#EEEEEE") ..  args["{/ avail_gb}"] .. " GB " .. " ·  " .. args["{/home avail_gb}"] .. " GB" .. spandef .. spandef
end, 3)


--{{---| Battery widget |---------------------------------------------------------------------------  

baticon = widget ({type = "imagebox" })
baticon.image = image(beautiful.widget_battery)
batwidget = widget({ type = "textbox" })
vicious.register( batwidget, vicious.widgets.bat, 
span_container(theme.color[5]) .. span("#FFF") .. "$1 $2%" .. spandef .. spandef, 1, 'BAT0')

--{{---| Net widget |-------------------------------------------------------------------------------

netwidget = widget({ type = "textbox" })
vicious.register(netwidget, 
vicious.widgets.net,
span_container(theme.color[6]) .. span("#FFFFFF") .. "${eth0 down_kb} ↓↑ ${eth0 up_kb}" .. spandef .. spandef, 3)
neticon = widget ({type = "imagebox" })
neticon.image = image(beautiful.widget_net)
netwidget:buttons(awful.util.table.join(awful.button({ }, 1,
function () awful.util.spawn_with_shell(iptraf) end)))

--{{---| Calendar widget |--------------------------------------------------------------------------

calwidget = widget({ type = 'textbox' })
	function dayth()
		local osd = os.date("%d")
		if osd == "01" or osd == "21" or osd == "31" then
			return "<span font='profont 6'><sup>st</sup></span>"
		elseif osd == "02" or osd == "22" then
			return "<span font='profont 6'><sup>nd</sup></span>"
		elseif osd == "03" or osd == "23" then
			return "<span font='profont 6'><sup>rd</sup></span>"
		else
			return "<span font='profont 6'><sup>th</sup></span>"
		end
	end
vicious.register(calwidget, vicious.widgets.date, span_container(theme.color[7]) .. span("#DDD") .. ' %a, %d' .. dayth() .. ' %b' .. spandef .. spandef, 3)

clockwidget = awful.widget.textclock({}, span_container(theme.color[7]) .. span("#DDD") .. "%H:%M:%S" .. spandef .. spandef, 1) 

--{{---| Separators widgets |-----------------------------------------------------------------------


arr = widget({type = "textbox"})
arr.text = span_arrow(theme.default_color,theme.init_color)

arr0 = widget({type = "textbox"})
arr0.text = span_arrow(theme.init_color, theme.init_color)

arr1 = widget({type = "textbox"})
arr1.text = span_arrow(theme.init_color, theme.color[1])

arr2 = widget({type = "textbox"})
arr2.text = span_arrow(theme.color[1], theme.color[2])

arr3 = widget({type = "textbox"})
arr3.text = span_arrow(theme.color[2], theme.color[3])

arr4 = widget({type = "textbox"})
arr4.text = span_arrow(theme.color[3], theme.color[4])

arr5 = widget({type = "textbox"})
arr5.text = span_arrow(theme.color[4], theme.color[5])

arr6 = widget({type = "textbox"})
arr6.text = span_arrow(theme.color[5], theme.color[6])

arr7 = widget({type = "textbox"})
arr7.text = span_arrow(theme.color[6], theme.default_color)

spr3f = widget({type="textbox"})
spr3f.text = span_container(theme.init_color) .. " " .. spandef

spr4f = widget({type="textbox"})
spr4f.text = span_container(theme.default_color) .. " " .. spandef


--{{---| Panel |------------------------------------------------------------------------------------

mywibox[s] = awful.wibox({ position = "top", screen = s, height = theme.wibox_height })

mywibox[s].widgets = {
   { mylauncher, mytaglist[s], mypromptbox[s], layout = awful.widget.layout.horizontal.leftright },
     mylayoutbox[s],
     spr3f,
     clockwidget,
     spr3f, 
     calwidget,
     spr4f,
     mysystray,
     spr4f,
     arr7, 
     netwidget,
     neticon,
     arr6,
     batwidget,
     baticon,
     arr5, 
     fswidget,
     fswidgeticon,
     arr4,
     tempwidget,
     tempicon,
     arr3,
     cpuwidget,
     cpuicon,
     arr2,
     memwidget,
     memicon,
     arr1,
     mailicon, 
     arr0,
     mpdwidget,
     music,
     arr,
     s == 1 and spr or nil, mytasklist[s], 
     layout = awful.widget.layout.horizontal.rightleft } end

     --{{---| Mouse bindings |---------------------------------------------------------------------------
root.buttons(awful.util.table.join(
  awful.button({ }, 3, function () mymainmenu:toggle() end),
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
))

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))


--{{---| Key bindings |-----------------------------------------------------------------------------

globalkeys = awful.util.table.join(
    awful.key({ altkey, "Control" }, "Left",   awful.tag.viewprev       ),
    awful.key({ altkey, "Control" }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
    awful.key({ modkey,           }, "j", function () awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end end),
    awful.key({ modkey,           }, "k", function () awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true, coords={x=0, y=14} })  end),
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
	awful.key({ modkey,           }, "Right",		 function ()
		awful.client.focus.byidx( 1)
		if client.focus then
			client.focus:raise()
		end
	end),
	awful.key({ modkey,           }, "Left",		 function ()
		awful.client.focus.byidx(-1)
		if client.focus then
			client.focus:raise()
		end
	end),
	awful.key({ modkey,           }, "Tab",			 function ()
		awful.client.focus.byidx( 1)
		if client.focus then
			client.focus:raise()
		end
	end),
  awful.key({ modkey, "Control" }, "Right",                function () awful.tag.incmwfact( 0.05) end),
  awful.key({ modkey, "Control" }, "Left",                 function () awful.tag.incmwfact(-0.05) end),


--{{---| Terminals, shells und multiplexors |---------------------------------------------------------\-\\
--

awful.key({ modkey,           }, "p", function ()
  awful.util.spawn("dmenu_run -i -b -p 'Run:' -nb '" .. 
  beautiful.bg_normal .. "' -nf '" .. beautiful.fg_normal .. 
  "' -sb '" .. beautiful.bg_focus .. 
  "' -sf '" .. beautiful.fg_focus .. "'") 
end),
awful.key({ modkey,           }, "Return", function() awful.util.spawn(terminal) end),
-- miscellaneous
awful.key({ modkey,           }, "grave",                function () awful.util.spawn(terminal .. " -e htop") end),
-- volume + mpd
awful.key({                   }, "XF86AudioLowerVolume", function () awful.util.spawn("amixer -q sset Master 2dB-") end),
awful.key({                   }, "XF86AudioRaiseVolume", function () awful.util.spawn("amixer -q sset Master 2dB+") end),
awful.key({                   }, "XF86AudioStop",        function () awful.util.spawn("mpc stop") end),
awful.key({                   }, "XF86AudioPlay",        function () awful.util.spawn("mpc toggle") end),
awful.key({                   }, "XF86AudioNext",        function () awful.util.spawn("mpc next") end),
awful.key({                   }, "XF86AudioPrev",        function () awful.util.spawn("mpc prev") end),
awful.key({                   }, "XF86AudioMute",        function () awful.util.spawn("amixer -q sset Master toggle") end),
awful.key({ modkey, "Shift"          }, "m",                    function () awful.util.spawn(terminal .. " -e ncmpcpp") end),
-- file managers
awful.key({ modkey,   "Shift"        }, "n",                    function () awful.util.spawn(terminal .. " -e nautilus") end),

                                                                                                        -- Layouts
    awful.key({ modkey, "Shift"   }, "Right",                function () awful.client.swap.byidx(  1) end),
    awful.key({ modkey, "Shift"   }, "Left",                 function () awful.client.swap.byidx( -1) end),

    -- Awesome
    awful.key({ modkey,           }, "space",                function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space",                function () awful.layout.inc(layouts, -1) end),

    -- Gvim
    awful.key({ modkey,           }, "g",                    function () awful.util.spawn("run_gvim") end),

    -- Prompts
    awful.key({ modkey, "Control", "Shift" }, "r",           function () mypromptbox[mouse.screen]:run() end),
    awful.key({ modkey, "Control", "Shift" }, "x",           function ()
      awful.prompt.run({ prompt = "Run Lua code: " },
      mypromptbox[mouse.screen].widget,
      awful.util.eval, nil,
      awful.util.getdir("cache") .. "/history_eval")
    end),

--{{--------------------------------------------------------------------------------------------------/-//

awful.key({ modkey, "Control" }, "r",        awesome.restart),
awful.key({ modkey, "Shift"   }, "q",        awesome.quit),
awful.key({ modkey, "Control" }, "n",        awful.client.restore),
awful.key({ modkey },            "r",        function () mypromptbox[mouse.screen]:run() end),
awful.key({ modkey,           }, "l",        function () awful.tag.incmwfact( 0.05)    end),
awful.key({ modkey,           }, "h",        function () awful.tag.incmwfact(-0.05)    end),
awful.key({ modkey, "Shift"   }, "h",        function () awful.tag.incnmaster( 1)      end),
awful.key({ modkey, "Shift"   }, "l",        function () awful.tag.incnmaster(-1)      end),
awful.key({ modkey, "Control" }, "h",        function () awful.tag.incncol( 1)         end),
awful.key({ modkey, "Control" }, "l",        function () awful.tag.incncol(-1)         end),
awful.key({ modkey,           }, "space",    function () awful.layout.inc(layouts,  1) end),
awful.key({ modkey, "Shift"   }, "space",    function () awful.layout.inc(layouts, -1) end)
)

clientkeys = awful.util.table.join(
awful.key({ modkey,           }, "f",        function (c) c.fullscreen = not c.fullscreen  end),
awful.key({ modkey,           }, "c",        function (c) c:kill()                         end),
awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
awful.key({ modkey, "Control" }, "Return",   function (c) c:swap(awful.client.getmaster()) end),
awful.key({ modkey,           }, "o",        awful.client.movetoscreen                        ),
awful.key({ modkey, "Shift"   }, "r",        function (c) c:redraw()                       end),
awful.key({ modkey,           }, "n",        function (c) c.minimized = true end),
awful.key({ modkey,           }, "m",        function (c) c.maximized_horizontal = not c.maximized_horizontal
c.maximized_vertical   = not c.maximized_vertical end)
)


--{{---| Set keys |---------------------------------------------------------------------------------


-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

--{{---| Rules |------------------------------------------------------------------------------------

awful.rules.rules = {
    { rule = { },
    properties = { size_hints_honor = false,
    border_width = beautiful.border_width,
    border_color = beautiful.border_normal,
    focus = true,
    keys = clientkeys,
    buttons = clientbuttons } },
    { rule = { class = "goldendict" },
    properties = { floating = true } },
    { rule = { class = "audacious" },
    properties = { floating = true } },
    { rule = { class = "xwinmosaic" },
    properties = { floating = true } },
    { rule = { class = "gimp" },
    properties = { floating = true } },
    { rule = { class = "Pidgin" },
    properties = { floating = true, tag = tags[1][8] } },

}

--{{---| Signals |----------------------------------------------------------------------------------

--[[client.add_signal("manage", function (c, startup)]]
    ---- Add a titlebar
    ---- awful.titlebar.add(c, { modkey = modkey })
    --c:add_signal("mouse::enter", function(c) if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            --and awful.client.focus.filter(c) then client.focus = c end end)
    --if not startup then if not c.size_hints.user_position and not c.size_hints.program_position then
            --[[awful.placement.no_overlap(c) awful.placement.no_offscreen(c) end end end)]]
client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)


--{{--| Autostart |---------------------------------------------------------------------------------

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
--{{Xx----------------------------------------------------------------------------------------------

