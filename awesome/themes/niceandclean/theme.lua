-- niceandclean, awesome3 theme, by Blazeix, based off of ghost1227's openbox theme.

--{{{ Main
require("awful.util")

theme = {}

home          = os.getenv("HOME")
config        = awful.util.getdir("config")
shared        = "/usr/share/awesome"
if not awful.util.file_readable(shared .. "/icons/awesome16.png") then
    shared    = "/usr/share/local/awesome"
end
sharedicons   = shared .. "/icons"
sharedthemes  = shared .. "/themes"
themes        = config .. "/themes"
themename     = "/niceandclean"
if not awful.util.file_readable(themes .. themename .. "/theme.lua") then
	themes = sharedthemes
end
themedir = themes .. themename

wallpaper1    = themedir .. "/background.jpg"
wallpaper2    = themedir .. "/background.png"
wallpaper3    = sharedthemes .. "/zenburn/zenburn-background.png"
wallpaper4    = sharedthemes .. "/default/background.png"

-- theme.wallpaper_cmd = { "awsetbg " .. themedir .. "/wallpaper-1.jpg" }
theme.wallpaper_cmd = { "feh --bg-scale " .. themedir .. "/wallpaper-1.jpg" }

if awful.util.file_readable(config .. "/vain/init.lua") then
    theme.useless_gap_width  = "3"
end
--}}}

theme.font          = "Sans 7" 

theme.bg_normal     = "#222222"
theme.bg_focus      = "#71badc"
--theme.bg_focus      = "#33aacc"
--theme.bg_focus      = "#dedede"

theme.bg_urgent     = "#d02e54"
theme.bg_minimize   = "#444444"

theme.fg_normal     = "#eeeeee"
theme.fg_focus      = "#000000"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = "1"
theme.border_normal = "#747474"
theme.border_focus  = "#71badc"
theme.border_marked = "#91231c"
--theme.border_focus  = "#dedede"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel = themedir .. "/taglist/squaref.png"
theme.taglist_squares_unsel = themedir .. "/taglist/square.png"

theme.tasklist_floating_icon = themedir .. "/tasklist/floatingw_grey.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themedir .. "/submenu.png"
theme.menu_height = "15"
theme.menu_width  = "110"
theme.menu_border_width = "0"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themedir .. "/titlebar/close_normal.png"
theme.titlebar_close_button_focus = themedir .. "/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = themedir .. "/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themedir .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themedir .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themedir .. "/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themedir .. "/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themedir .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themedir .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themedir .. "/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themedir .. "/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themedir .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themedir .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themedir .. "/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themedir .. "/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themedir .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themedir .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themedir .. "/titlebar/maximized_focus_active.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themedir .. "/layouts/fairhw.png"
theme.layout_fairv = themedir .. "/layouts/fairvw.png"
theme.layout_floating = themedir .. "/layouts/floatingw.png"
theme.layout_magnifier = themedir .. "/layouts/magnifierw.png"
theme.layout_max = themedir .. "/layouts/maxw.png"
theme.layout_fullscreen = themedir .. "/layouts/fullscreenw.png"
theme.layout_tilebottom = themedir .. "/layouts/tilebottomw.png"
theme.layout_tileleft = themedir .. "/layouts/tileleftw.png"
theme.layout_tile = themedir .. "/layouts/tilew.png"
theme.layout_tiletop = themedir .. "/layouts/tiletopw.png"
theme.layout_spiral = themedir .. "/layouts/spiralw.png"
theme.layout_dwindle = themedir .. "/layouts/dwindlew.png"

theme.awesome_icon = themedir .. "/arch.png"

theme.widget_disk     = themes .. "/icons/dust/disk.png"
theme.widget_ac       = themes .. "/icons/dust/ac.png"
theme.widget_acblink  = themes .. "/icons/dust/acblink.png"
theme.widget_blank    = themes .. "/icons/dust/blank.png"
theme.widget_batfull  = themes .. "/icons/dust/batfull.png"
theme.widget_batmed   = themes .. "/icons/dust/batmed.png"
theme.widget_batlow   = themes .. "/icons/dust/batlow.png"
theme.widget_batempty = themes .. "/icons/dust/batempty.png"
theme.widget_vol      = themes .. "/icons/dust/vol.png"
theme.widget_mute     = themes .. "/icons/dust/mute.png"
theme.widget_pac      = themes .. "/icons/dust/pac.png"
theme.widget_pacnew   = themes .. "/icons/dust/pacnew.png"
theme.widget_mail     = themes .. "/icons/dust/mail.png"
theme.widget_mailnew  = themes .. "/icons/dust/mailnew.png"
theme.widget_temp     = themes .. "/icons/dust/temp.png"
theme.widget_tempwarm = themes .. "/icons/dust/tempwarm.png"
theme.widget_temphot  = themes .. "/icons/dust/temphot.png"
theme.widget_wifi     = themes .. "/icons/dust/wifi.png"
theme.widget_nowifi   = themes .. "/icons/dust/nowifi.png"
theme.widget_mpd      = themes .. "/icons/dust/mpd.png"
theme.widget_net      = themes .. "/icons/net_wired.png"
theme.widget_play     = themes .. "/icons/dust/play.png"
theme.widget_pause    = themes .. "/icons/dust/pause.png"
theme.widget_ram      = themes .. "/icons/dust/ram.png"
theme.widget_cpu      = themes .. "/icons/dust/cpu.png"
theme.widget_mem      = themes .. "/icons/dust12/ram.png"
theme.widget_swap     = themes .. "/icons/dust12/swap.png"
theme.widget_fs       = themes .. "/icons/dust12/fs_01.png"
theme.widget_fs2      = themes .. "/icons/dust12/fs_02.png"
theme.widget_up       = themes .. "/icons/dust/up.png"
theme.widget_down     = themes .. "/icons/dust/down.png"

theme.widget_mpd_play = themes .. "/icons/play.png"
theme.widget_mpd_stop = themes .. "/icons/stop.png"
theme.widget_mpd_pause = themes .. "/icons/pause.png"
theme.widget_mpd_prev = themes .. "/icons/prev.png"
theme.widget_mpd_next =  themes .. "/icons/next.png"

return theme
