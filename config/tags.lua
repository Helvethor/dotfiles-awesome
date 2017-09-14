local dpi = require("beautiful").xresources.apply_dpi
local tags = {}

local l = c.layouts.named

local function mg_callback(tag)
	c.awful.tag.incmwfact(0.3, tag)
end

tags.names = {
--	{ "1", "2", "3", "4", "5", "6" },
	{ "Q", "W", "E", "R", "T", "Z" },
	{ "I", "II", "III", "IV", "V", "VI" }
}

tags.keys = {
	{ "q", "w", "e", "r", "t", "z" },
	{ "#10", "#11", "#12", "#13", "#14", "#15" }
}

tags.layouts = {
	{l.tl, l.tl, l.tl, l.tl, l.mg, l.tl},
	{l.tl, l.tl, l.tl, l.tl, l.tl, l.tl}
}

tags.callbacks = {
	{nil, nil, nil, nil, mg_callback, nil},
	{nil, nil, nil, nil, nil, nil}
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
		tag = c.awful.tag.add(tag_name, { 
			gap = c.beautiful.useless_gap,
			screen = s,
			selected = i == 1,
			layout = tags.layouts[s.index][i],
		})
		local callback = tags.callbacks[s.index][i]
		if callback then
			callback(tag)
		end
	end
end

return tags

-- vim: filetype=lua:foldmethod=marker
