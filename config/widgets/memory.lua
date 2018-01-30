-- Memory

local function memory()
	local wt, wm, wbk, wb
	wt = c.wibox.widget.textbox()
	wm, wbk, wb = c.widgets.wrap(wt)
	c.vicious.register(wt, c.vicious.widgets.mem, 
		function (wt, args)
			local color = c.beautiful.nofocus
			if args[1] > 75 then
				color = c.beautiful.danger
			elseif args[1] > 50 then
				color = c.beautiful.warn
			end
			wb:set_color(color)

			return c.beautiful.iconify(0x00e021, color, true) .. " " .. args[1] .. "%"
		end, 5)
	return wm
end

return memory

-- vim: filetype=lua:foldmethod=marker
