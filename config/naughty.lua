local naughty = require("naughty")

naughty.config.defaults = {
	timeout = 10,
	text = "",
	screen = 1,
	ontop = true,
	margin = c.beautiful.margin,
	opacity = c.beautiful.naughty_opacity,
	border_width = c.beautiful.border_width,
	border_color = c.beautiful.focus,
	fg = c.beautiful.fg,
	bg = c.beautiful.bg,
	position = "bottom_right"
}
naughty.config.presets = {
	normal = {},
	low = {
		timeout = 10
	},
	critical = {
		border_color = c.beautiful.urgent,
		timeout = 0,
	}
}

return naughty

-- vim: filetype=lua:foldmethod=marker
