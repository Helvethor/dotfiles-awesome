-- Arch updates

local icon = 0x00e00f

local function update(wt, wb)
	return function ()
		c.awful.spawn.easy_async_with_shell("echo $(checkupdates | wc -l)/$(pacaur -Qu | wc -l)",
			function (stdout, stderr, reason, exit_code)
				-- Remove trailing \n
				stdout = stdout:sub(1, #stdout - 1)
				-- Get arch updates
				local slash_idx = stdout:find('/')
				local arch_updates = tonumber(stdout:sub(1, slash_idx - 1))
                local color = c.beautiful.nofocus
				if arch_updates > 50 then
					color = c.beautiful.danger
				elseif arch_updates > 25 then
					color = c.beautiful.warning
				end
				wb:set_color(color)
                local icon = c.beautiful.iconify(icon, color, true)
				wt:set_markup(icon .. " " .. stdout)
			end)
		return true
	end
end


local function arch()
	local wt = c.wibox.widget.textbox()
	local wm, wbk, wb = c.widgets.wrap(wt)
	local uf = update(wt, wb)
	wt:set_markup(c.beautiful.iconify(icon) .. " ?/?")
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
