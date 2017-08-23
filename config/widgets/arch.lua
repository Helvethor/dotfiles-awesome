-- Arch updates

local icon = c.beautiful.iconify(0x00e00f)

local function update(wt, wb)
	return function ()
		c.awful.spawn.easy_async_with_shell("echo $(checkupdates | wc -l)/$(pacaur -Qu | wc -l)",
			function (stdout, stderr, reason, exit_code)
				-- Remove trailing \n
				stdout = stdout:sub(1, #stdout - 1)
				-- Get arch updates
				local slash_idx = stdout:find('/')
				local arch_updates = tonumber(stdout:sub(1, slash_idx - 1))
				if arch_updates > 50 then
					wb:set_color(c.beautiful.urgent)
				elseif arch_updates > 25 then
					wb:set_color(c.beautiful.warn)
				else
					wb:set_color(c.beautiful.nofocus)
				end
				wt:set_markup(icon .. " " .. stdout)
			end)
		return true
	end
end


local function arch()
	local wt = c.wibox.widget.textbox()
	local wm, wbk, wb = c.widgets.wrap(wt)
	local uf = update(wt, wb)
	wt:set_markup(icon .. " ?/?")
	wm:buttons(c.bindings.buttons.arch)
	uf()
	c.gears.timer({
		timeout = 1800,
		autostart = true,
		callback = uf
	})
	return wm
end

return arch

-- vim: filetype=lua:foldmethod=marker
