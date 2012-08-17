-- LIBRARIES
require("awful")
require("awful.autofocus")
require("awful.rules")
require("wibox")
require("beautiful")
require("naughty")
require("vicious")
require("shifty")
require("menubar")


-- MENUBAR
-- menubar.cache_entries = true
-- menubar.app_folders = { "/usr/share/applications/" }
-- menubar.show_categories = true   -- Change to false if you want only programs to appear in the menu
-- menubar.set_icon_theme("Faenza")

--ERRORS
-- Startup error handling
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "There were errors during startup!",
		text = awesome.startup_errors
	})
end

-- Runtime errors after startup
do local in_error = false
	awesome.connect_signal("debug::error",
	function (err)
		-- Make sure we don't go into an endless error loop
		if in_error then return end
		in_error = true
		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "An error occurred!",
			text = err
		})
		in_error = false
    	end)
end

-- DEFAULTS
terminal   = "urxvt"
editor     = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
browser    = "firefox"
modkey     = "Mod4"
altkey     = "Mod1"

-- THEME
beautiful.init("/home/samuel/.config/awesome/themes/niceandclean/theme.lua")


-- CONFIGS
require("colours")
-- require("remind") #dont really need it right now
require("tags")
require("my_menu")
require("widgetstop")
require("widgetsbottom")
require("creation")
require("bindings")
require("autostart")
require("signals")
