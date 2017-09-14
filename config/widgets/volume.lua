-- Volume

local function volume()
	local wt, wm, wbk, wb
	wt = c.wibox.widget.textbox()
	wm, wbk, wb = c.widgets.wrap(wt)
	wm:buttons(c.bindings.buttons.volume)

	c.vicious.register(wt, c.vicious.widgets.volume,
		function (wt, args)
			local mute = args[2] == "♩"
			local color = c.beautiful.nofocus
			local icon = 0x00e203
			if mute then
				color = c.beautiful.mark 
				icon = 0x00e204
			elseif args[1] > 90 then
				color = c.beautiful.urgent
			elseif args[1] > 75 then
				color = c.beautiful.warn
			end
			wb:set_color(color)
			return c.beautiful.iconify(icon) .. " " .. args[1] .. "%"
		end, 10, "Master")

	function wm.up(n)
		n = n or 1
		c.awful.spawn.easy_async('pulseaudio-ctl up ' .. n .. '%', wm.force)
	end

	function wm.down(n)
		n = n or 1
		c.awful.spawn.easy_async('pulseaudio-ctl down ' .. n .. '%', wm.force)
	end

	function wm.mute()
		c.awful.spawn.easy_async('pulseaudio-ctl mute', wm.force)
	end

	return wm
end

return volume

-- vim: filetype=lua:foldmethod=marker
