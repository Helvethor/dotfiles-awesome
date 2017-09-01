local layouts = {}

layouts.named = {
	tl = c.awful.layout.suit.tile.left,
	tr = c.awful.layout.suit.tile.right,
	tb = c.awful.layout.suit.tile.bottom,
	fr = c.awful.layout.suit.fair,
	mg = c.awful.layout.suit.magnifier
}

layouts.list = {
	layouts.named.tl,
	layouts.named.tr,
	layouts.named.tb,
	layouts.named.fr,
	layouts.named.mg
}


return layouts

-- vim: filetype=lua:foldmethod=marker
