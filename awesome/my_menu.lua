-- MENU
-- sub menus
networkmenu = {
	{ "firefox",    "firefox"               }
}
officemenu = {
	{ "writer",     "libreoffice -writer"   },
	{ "calc",       "libreoffice -calc"     },
	{ "impress",    "libreoffice -impress"  },
}
editorsmenu = {
}
graphicsmenu = {
	{ "gimp",       "gimp"                  },
}
utilitiesmenu = {
}
awesomemenu = {
	{ "lock",       terminal .. " -e xflock4" },
	{ "restart",    awesome.restart         },
	{ "quit",       awesome.quit            },
	{ "shutdown", 	terminal .. " -e shutdown" },
	{ "restartc", 	terminal .. " -e reboot " }
}

-- main menu
mymainmenu = awful.menu({
	items = {
		{ "network",   networkmenu       },
		{ "office",    officemenu        },
		{ "editors",   editorsmenu       },
		{ "graphics",  graphicsmenu      },
		{ "utilities", utilitiesmenu     },
		{ "awesome",   awesomemenu       },
		{ "terminal",  terminal          }
		}
})
