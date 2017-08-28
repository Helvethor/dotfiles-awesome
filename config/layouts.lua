local layouts = {}

layouts.named = {
	tl = c.awful.layout.suit.tile.left,
	tr = c.awful.layout.suit.tile.right,
	tb = c.awful.layout.suit.tile.left,
	fr = c.awful.layout.suit.tile.fair,
	mg = c.awful.layout.suit.tile.magnifier
}

layouts.list = {
	tl,
	tr,
	tb,
	fr,
	mg
}



return layouts

-- vim: filetype=lua:foldmethod=marker
