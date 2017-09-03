---- Battery

local function get_battery()
	local file = assert(io.popen('ls /sys/class/power_supply', 'r'))
	local output = file:read('*all')
	file:close()
	for battery in output:gmatch("%w+") do
		return battery
	end
end


local function battery()
	local wt, wm, wbk, wb
	local bat = get_battery()

	if not bat then
		return nil
	end

	wt = c.wibox.widget.textbox()
	wm, wbk, wb = c.widgets.wrap(wt)
	c.vicious.register(wt, c.vicious.widgets.bat, 
		function (wt, args)
			charging = args[1] == '+'
			remaining_percent = args[2]
			remaining_time = args[3]
			
			if remaining_percent > 75 then
				icon = 0x00e23a
				color = c.beautiful.focus
			elseif remaining_percent > 50 then
				icon = 0x00e238
				color = c.beautiful.nofocus
			elseif remaining_percent > 25 then
				icon = 0x00e237
				color = c.beautiful.warn
			else
				icon = 0x00e236
				color = c.beautiful.urgent
			end

			if charging then
				icon = 0x00e239
			end

			icon = c.beautiful.iconify(icon)
			text = icon .. " " .. remaining_time

			wb:set_color(color)
			return text
		end, 5, bat)
	return wm

end

return battery

-- vim: filetype=lua:foldmethod=marker
