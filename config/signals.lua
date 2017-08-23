local awful = require("awful")
local beautiful = c.beautiful

-- Signal function to execute when a new client appears.
client.connect_signal("manage",
	function(c)
		if awesome.startup and
			not c.size_hints.user_position
			and not c.size_hints.program_position then

			-- Prevent clients from being unreachable after screen count changes.
			awful.placement.no_offscreen(c)
		end
	end
)

-- Enable sloppy focus
client.connect_signal("mouse::enter",
	function(c)
		if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
			and awful.client.focus.filter(c) then
			client.focus = c
			--client.focus:raise()
		end
	end
)

client.connect_signal("unfocus", 
	function(c)
		c.border_color = beautiful.nofocus
	end
)
client.connect_signal("focus", 
	function(c)
		if c.sticky then
			c.border_color = beautiful.mark
		else
			c.border_color = beautiful.focus
		end
	end
)
client.connect_signal("property::sticky",
	function(c)
		if c.sticky then
			c.border_color = beautiful.mark
		else
			if client.focus then
				c.border_color = beautiful.focus
			else
				c.border_color = beautiful.nofocus
			end
		end
	end
)

-- vim: filetype=lua:foldmethod=marker
