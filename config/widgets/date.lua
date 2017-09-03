-- Date

local function date()
--	local w = c.wibox.widget.textbox()
--	c.vicious.register(w, c.vicious.widgets.date, "%b %d %Y " 
--		.. c.beautiful.iconify(0x00e017) .. " %H:%M")
--	w = c.widgets.wrap(w)
--	c.widgets.set_tooltip(w, "echo; date; echo; cal -3 -m | head -n -1")
--	w:buttons(c.awful.util.table.join(
--		c.awful.button({ }, 1, function(t)
--			c.awful.spawn(c.apps.calendar)
--		end)
--	))
--	return w

	local wt, wm, wbk, wb, state, icon

	wt = c.wibox.widget.textbox()
	wm, wbk, wb = c.widgets.wrap(wt)
	state = "light"
	icon = c.beautiful.iconify(0x00e017)

	c.vicious.register(wt,
		function ()
			if state == "light" then
				date = os.date("%d/%m/%y")
				time = os.date("%R")
			else
				date = os.date("%a %d %b %G")
				time = os.date("%T")
			end

			text = date .. " " .. icon .. " " .. time
			
			return text
		end, nil, 1)

	wm:buttons(c.gears.table.join(
		c.awful.button({ }, 1,
			function ()
				if state == "light" then
					state = "full"
				else
					state = "light"
				end
				wm.force()
			end)
	))

	
	return wm
end

return date

-- vim: filetype=lua:foldmethod=marker
