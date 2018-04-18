-- Network 

local function get_network_device()
	local file = assert(io.popen('ls /sys/class/net', 'r'))
	local output = file:read('*all')
	file:close()
	for device in output:gmatch("%w+") do
		if string.sub(device, 1, 2) == "en" then
			return device
		elseif string.sub(device, 1, 2) == "wl" then
			return device
		end
	end
	return "enps025"
end

local function network()
	local device = get_network_device()
	local wt, wm, wbk, wb
	wt = c.wibox.widget.textbox()
	wm, wbk, wb = c.widgets.wrap(wt)
	wm:buttons(c.bindings.buttons.network)

	c.vicious.register(wt, c.vicious.widgets.net, 
		function (wt, args)
			local color, icon, text, carrier
			carrier = args["{" .. device .. " carrier}"]

			if carrier == 1 then
				color = c.beautiful.nofocus
				if string.sub(device, 1, 2) == "wl" then
					icon = 0x00e21a
				else
					icon = 0x00e19c
				end
			else
				color = c.beautiful.danger
				icon = 0x00e040
			end

            icon = c.beautiful.iconify(icon, color, true)
			text = icon .. " " .. device

			wb:set_color(color)
			return text
		end, 5)
	return wm

end

return network

-- vim: filetype=lua:foldmethod=marker
