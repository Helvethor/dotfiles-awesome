local layouts = {}

layouts.list = {
	c.awful.layout.suit.tile.left,
	c.awful.layout.suit.tile.right,
	c.awful.layout.suit.tile.bottom,
	c.awful.layout.suit.fair,
	c.awful.layout.suit.magnifier
}

return layouts

-- vim: filetype=lua:foldmethod=marker
