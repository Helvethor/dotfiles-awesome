-- Date

local function date()
	local w = c.wibox.widget.textbox()
	c.vicious.register(w, c.vicious.widgets.date, "%b %d %Y " 
		.. c.beautiful.iconify(0x00e017) .. " %H:%M")
	w = c.widgets.wrap(w)
	c.widgets.set_tooltip(w, "echo; date; echo; cal -3 -m | head -n -1")
	w:buttons(c.awful.util.table.join(
		c.awful.button({ }, 1, function(t)
			c.awful.spawn(calendar)
		end)
	))
	return w
end

return date

-- vim: filetype=lua:foldmethod=marker
