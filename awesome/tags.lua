-- TAGS
-- Layouts
layouts =
{
	awful.layout.suit.tile,
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	awful.layout.suit.max,
	awful.layout.suit.floating
}

-- Shifty: predefined tags
shifty.config.tags   = {
	["def"]        = { init = true, position = 1, layout = awful.layout.suit.floating        },
	["doc"]    = { init = true, position = 2, layout = awful.layout.suit.floating  },
	["web"] = { init = true, position = 3, layout = awful.layout.suit.max                      },
	--["IDE"] = { init = true, position = 4, layout = awful.layout.suit.floating                      },
	["1:work"]  = { init = true,  position = 4, layout = awful.layout.suit.tile                 },
	["2:work"]  = { init = true, position = 5, layout = awful.layout.suit.tile              },
	["3:work"]   = { init = true, position = 6, layout = awful.layout.suit.tile  },
	["im"]= { init = true, position = 7, layout = awful.layout.suit.tile.left                     },
	["music"]        = { init = false, position = 8, layout = awful.layout.suit.floating                      },
	["gimp"]        = { init = false, position = 9, layout = awful.layout.suit.floating                     },
	["video"]  = { position = 10, layout = awful.layout.suit.floating                                    },
	["picture"]  = { layout = awful.layout.suit.max                                    },
	["foo"] = { init = true, layout = awful.layout.suit.floating } 
}

-- Shifty: tags matching and client rules
shifty.config.apps = {
	-- net
	{ match = { "Thunderbird", "Firefox"       }, tag = "web",                                               },
	{ match = { "mutt"                   }, tag = "web",                                               },
	--office
	{ match = { "Libreoffice", "Lynx"   }, tag = "doc",                                            },
	-- gimp
	{ match = { "Gimp"                   }, tag = "gimp",                                              },
	{ match = { "gimp%-image%-window"    }, geometry = {176,15,929,800},                border_width = 0 },
	{ match = { "^gimp%-toolbox$"        }, geometry = {0,15,175,800},    slave = true, border_width = 0 },
	{ match = { "^gimp%-dock$"           }, geometry = {930,15,1280,800}, slave = true, border_width = 0 },
	--video
	{ match = { "MPlayer", "Vlc", "SMplayer"  }, tag = "video", geometry = {15,30,nil,nil}, float = true    },
	-- music
	{ match = { "audacious"  }, tag = "music",                                             },
	-- im
	{ match = { "irssi", "Pidgin"                  }, tag = "im"     },
	-- miscellaneous
	{ match = { "sxiv", "gpicview", "feh"       }, tag = "picture",                                             },
	--{ match = { "Eclipse",        }, tag = "IDE",                                             },
	
	-- client manipulation
	{ match = { "" },
		honorsizehints = false,
		buttons = awful.util.table.join (
		awful.button({        }, 1, function (c) client.focus = c; c:raise() end),
		awful.button({ modkey }, 1, awful.mouse.client.move),
		awful.button({ modkey }, 3, awful.mouse.client.resize))
	},
}

-- shifty: defaults
shifty.config.defaults = {
	layout = awful.layout.suit.floating,
}
shifty.config.layouts = layouts
shifty.init()
