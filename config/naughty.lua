local naughty = require("naughty")

naughty.config = {
	padding = c.beautiful.display_unit * 2,
	spacing = c.beautiful.display_unit
}

naughty.config.defaults = {
	timeout = 8,
	screen = 1,
	ontop = true,
	position = "bottom_left"
}

naughty.config.presets = {
	normal = {},
	low = {
		border_color = c.beautiful.nofocus,
		timeout = 4
	},
	debug = {
		title = "Debug",
		border_color = c.beautiful.mark,
		timeout = 0,
	},
	critical = {
		title = "Error",
		border_color = c.beautiful.danger,
		bg = c.beautiful.bg,
		fg = c.beautiful.fg,
		timeout = 0,
	}
}

--naughty.notify({preset=naughty.config.presets.low, text='low'})
--naughty.notify({preset=naughty.config.presets.normal, text='normal'})
--naughty.notify({preset=naughty.config.presets.debug, text='debug'})
--naughty.notify({preset=naughty.config.presets.critical, text='critical'})

return naughty

-- vim: filetype=lua:foldmethod=marker
