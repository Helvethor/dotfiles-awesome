
c.awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = { },
		properties = {
			border_width = c.beautiful.border_width,
			border_color = c.beautiful.nofocus,
			focus = c.awful.client.focus.filter,
			keys = c.bindings.keys.client,
			raise = true,
			size_hints_honor = false,
			buttons = c.bindings.buttons.client,
			screen = c.awful.screen.preferred,
			placement = c.awful.placement.no_overlap+c.awful.placement.no_offscreen,
			--floating = false,
			maximized_horizontal = false,
			maximized_vertical = false,
			maximized = false,
		}
	},
	{
		rule_any = { 
			class = {
				"VirtualBox",
				"Virt-manager",
				"Vinagre"
			}
		},
		except_any = {
			name = {
				"Oracle VM VirtualBox Manager",
				"Virtual Machine Manager"
			},
		},
		properties = { floating = true, size_hints_honor = true }
	},
	{
		rule_any = {
			class = {
				"mpv",
				"feh",
				"pinentry",
				"Gimp-2.8",
				"Guvcview",
				"Vlc",
				"Xephyr",
				"Plugin-container",
				"Telegram",
				"Cutegram",
				"Pavucontrol",
				"Keepassx",
			},
		},
		properties = {
			floating = true,
			size_hints_honor = true
		}
	},
	{ 
		rule_any = {
			class = {
				"Gimp-2.8"
			},
		},
		properties = {
			screen = 1,
			tag = c.tags.names[1][4],
			floating = true
		}
	},
	{
		rule_any = {
			class = {
				"Inkscape"
			}
		},
		properties = {
			screen					= 1,
			tag						= c.tags.names[1][4],
			fullscreen				= false,
			maximized_vertical		= false,
			maximized_horizontal	= false,
			floating				= false
		}
	},
	{ 
		rule_any = {
			class = {
				"Geary",
				"Gnome-calendar"
			},
		},
		properties = {
			screen = 1,
			tag = c.tags.names[1][5],
		}
	},
	{ 
		rule_any = {
			class = {
				"Nextcloud"
			},
		},
		properties = {
			screen = 1,
			tag = c.tags.names[1][6],
			floating = false
		}
	}
}


-- vim: filetype=lua:foldmethod=marker
