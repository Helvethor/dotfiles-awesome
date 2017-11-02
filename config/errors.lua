local errors = {}

function errors.init()
	-- Check if awesome encountered an error during startup and fell back
	-- to another config (This code will only ever execute for the
	-- fallback config)

	if awesome.startup_errors then
		c.naughty.notify({
			preset = c.naughty.config.presets.critical,
			title = "Oops, there were errors during startup!",
			text = awesome.startup_errors })
	end

	-- Handle runtime errors after startup
	local in_error = false
	awesome.connect_signal("debug::error", errors.handler)
end

function errors.handler(message)
		-- Make sure we don't go into an endless error loop
		if in_error then return end
		in_error = true

		c.naughty.notify({
			preset = c.naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(message) })
		in_error = false
	end

return errors

-- vim: filetype=lua:foldmethod=marker
