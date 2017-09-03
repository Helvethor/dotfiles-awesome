local widgets = {}

function widgets.wrap(widget, no_border)

	local force = function()
		local widget = widget
		c.vicious.force({ widget })
	end

	local border = not no_border
	local wb, wbk, wm
	local widget = widget

	if border then
		wb = c.wibox.container.margin()
		wb:set_color(c.beautiful.widgets_border_color)
		wb:set_top(c.beautiful.widgets_border_width)
		wb:set_widget(widget)
		widget = wb
	end

	wbk = c.wibox.container.background()
	wbk:set_bg(c.beautiful.widgets_bg)
	wbk:set_fg(c.beautiful.widgets_fg)
	wbk:set_widget(widget)
	widget = wbk

	wm = c.wibox.container.margin()
	wm:set_left(c.beautiful.display_unit)
	wm:set_right(c.beautiful.display_unit)
	wm:set_widget(widget)
	wm.force = force

	return wm, wbk, wb
end

function widgets.set_notification(widget, command)
	widget.widget:connect_signal("mouse::enter", function()
		c.awful.spawn.easy_async(command, function(stdout, stderr, reason, exit_code)
			widget.notification = c.naughty.notify({ text = stdout, timeout = 0 })
		end)
	end)

	widget.widget:connect_signal("mouse::leave", function()
		c.naughty.destroy(widget.notification)
	end)
end

function widgets.set_tooltip(widget, command)
	c.awful.tooltip({
		objects = { widget.widget },
		timer_function = function()
			local f = assert(io.popen(command, "r"))
			local s = assert(f:read("*a"))
			f:close()
			return s
		end
	})
end

function widgets.refresh(widgets)
	for name, widget in pairs(widgets) do
		widget.force()
	end
end

function widgets.init()
	widgets.arch = require("config.widgets.arch")
	widgets.cpu = require("config.widgets.cpu")
	widgets.date = require("config.widgets.date")
	widgets.memory = require("config.widgets.memory")
	widgets.network = require("config.widgets.network")
	widgets.volume = require("config.widgets.volume")
	widgets.taglist = require("config.widgets.taglist")
	widgets.layoutbox = require("config.widgets.layoutbox")
	widgets.battery = require("config.widgets.battery")
end

return widgets

-- vim: filetype=lua:foldmethod=marker
