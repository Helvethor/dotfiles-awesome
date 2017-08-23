local screen = c.awful.screen

screen.widgets = { }
screen.widgets.arch = c.widgets.arch()
screen.widgets.cpu = c.widgets.cpu()
screen.widgets.memory = c.widgets.memory()
screen.widgets.network = c.widgets.network()
screen.widgets.date = c.widgets.date()
screen.widgets.volume = c.widgets.volume()

function screen.connect_screen(s)
	local wallpaper, layoutboxw, taglistw
	
	wallpaper = c.gears.wallpaper.maximized(c.beautiful.wallpaper, s, false)
	c.tags.add_to_screen(s)

	taglistw = c.widgets.taglist(s)

	layoutboxw = c.widgets.layoutbox(s)

	s.wibar = c.awful.wibar({ position = "top", screen = s, height = c.beautiful.wibar_height,
		bg = c.beautiful.wibar_bg })
	s.wibar:setup {
		layout = c.wibox.layout.align.horizontal(),
		{ -- Left widgets
			layout = c.wibox.layout.fixed.horizontal,
			taglistw
		},
		{ -- Middle widget
			layout = c.wibox.layout.fixed.horizontal,
		},
		{ -- Right widgets
			layout = c.wibox.layout.fixed.horizontal,
			screen.widgets.volume,
			screen.widgets.arch,
			screen.widgets.cpu,
			screen.widgets.memory,
			screen.widgets.network,
			screen.widgets.date,
			layoutboxw,
		},
	}
end

function screen.init()
	c.awful.screen.connect_for_each_screen(screen.connect_screen)
end

return screen

-- vim: filetype=lua:foldmethod=marker
