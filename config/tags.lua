local dpi = require("beautiful").xresources.apply_dpi
local tags = {}

tags.names = {
--	{ "1", "2", "3", "4", "5", "6" },
	{ "I", "II", "III", "IV", "V", "VI" },
	{ "Q", "W", "E", "R", "T", "Z" }
}

tags.keys = {
	{ "#10", "#11", "#12", "#13", "#14", "#15" },
	{ "q", "w", "e", "r", "t", "z" }
}

tags.buttons = c.awful.util.table.join(
	c.awful.button({ }, 1, c.awful.tag.viewonly),
	c.awful.button({ c.common.modkey }, 1, c.awful.client.movetotag),
	c.awful.button({ }, 3, c.awful.tag.viewtoggle),
	c.awful.button({ c.common.modkey }, 3, c.awful.client.toggletag),
	c.awful.button({ }, 4, function(t) c.awful.tag.viewnext(c.awful.tag.getscreen(t)) end),
	c.awful.button({ }, 5, function(t) c.awful.tag.viewprev(c.awful.tag.getscreen(t)) end)
)

function tags.add_to_screen(s)
	for i, tag_name in pairs(tags.names[s.index]) do
		c.awful.tag.add(tag_name, { 
			gap = c.beautiful.useless_gap,
			screen = s,
			selected = i == 1,
			layout = c.layouts.list[1]
		})
	end
end

return tags

-- vim: filetype=lua:foldmethod=marker
