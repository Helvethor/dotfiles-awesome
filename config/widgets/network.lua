-- Network 

local function network()
	local networkinterface = c.common.networkinterface
	local w = c.wibox.widget.textbox()
	c.vicious.register(w, c.vicious.widgets.net,
		c.beautiful.iconify(0x00e061) .. " ${" .. networkinterface .. " down_mb}M "
			.. c.beautiful.iconify(0x00e060) .. " ${" .. networkinterface .. " up_mb}M")
	w = c.widgets.wrap(w)
	return w
end

return network

-- vim: filetype=lua:foldmethod=marker
