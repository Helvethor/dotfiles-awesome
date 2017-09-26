local bindings = { keys = {}, buttons= {}}
local modkey = c.common.modkey
local altkey = c.common.altkey
local shiftkey = c.common.shiftkey
local ctrlkey = c.common.ctrlkey
local spacekey = c.common.spacekey

local gtable = c.gears.table
local abutton = c.awful.button
local akey = c.awful.key
local hotkeys_popup = require("awful.hotkeys_popup").widget


-- {{{ Miscellaneous

-- {{{ Screenshot function
local function screenshot(region, clipboard)
	local command = "maim "
	local text = "The screenshot was "
	if region then
		command = command .. "-s "
	end
	if clipboard then
		command = command .. "| xclip -selection clipboard -t image/png"
		text = text .. "copied to clipboard"
	else
		local filename = c.common.homedir .. "/media/pictures/screenshots/"
			.. os.date("%Y-%m-%d_%H-%M-%S") .. ".png"
		command = command .. filename 
		text = text .. "saved as\n" .. filename
	end
	
	c.awful.spawn.easy_async_with_shell(command,
		function()
			c.naughty.notify({
				title = "Screenshot taken",
				text = text,
				screen = mouse.screen,
				timeout = 2,
			})
		end)
end
-- }}}

-- {{{ Lock mouse function
local mouse_locked_client = nil
local function lock_mouse()
	local f = function(s)
		if mouse_locked_client then
			client.focus = mouse_locked_client

			cg = client.focus:geometry()
			mg = mouse.coords()

			newx = mg.x > cg.x + cg.width
				and cg.x + cg.width or mg.x < cg.x and cg.x
			newy = mg.y > cg.y + cg.height
				and cg.y + cg.height or mg.y < cg.y and cg.y

			mouse.coords({ x = newx, y = newy }) 
		end
	end

	if mouse_locked_client then
		mouse_locked_client:disconnect_signal("mouse::leave", f)
		mouse_locked_client = nil
		text = "Mouse unlocked"
	else
		mouse_locked_client = client.focus
		mouse_locked_client:connect_signal("mouse::leave", f)
		text = "Mouse locked in client"
	end

	c.naughty.notify({
		title = 'Mouse locker',
		text = text
	})
end
-- }}}

bindings.keys.misc = gtable.join(
	akey({ }, "XF86MonBrightnessDown",
		function()
			c.awful.spawn("xbacklight -dec 5 -steps 5", false)
		end),
	akey({ }, "XF86MonBrightnessUp",
		function()
			c.awful.spawn("xbacklight -inc 5 -steps 5", false)
		end),
	akey({ }, "XF86AudioRaiseVolume",
		function()
			c.screen.widgets.volume.up()
		end),
	akey({ }, "XF86AudioLowerVolume",
		function()
			c.screen.widgets.volume.down()
		end),
	akey({ }, "XF86AudioMute",
		function()
			c.screen.widgets.volume.mute()
		end),
	-- Take a screenshot
	akey({ }, "Print",
		screenshot,
		{ description = "screenshot", group = "misc" }),
	akey({ shiftkey }, "Print",
		function()
			screenshot(true, false)
		end,
		{ description = "screenshot", group = "misc" }),
	akey({ ctrlkey }, "Print",
		function()
			screenshot(false, true)
		end,
		{ description = "screenshot", group = "misc" }),
	akey({ ctrlkey, shiftkey }, "Print",
		function()
			screenshot(true, true)
		end,
		{ description = "screenshot", group = "misc" })
)
-- }}}

-- {{{ Awesome
local jautolock_busy = false
bindings.keys.awesome = gtable.join(
	-- Awesome management
	akey({ modkey, shiftkey }, "x",
		function() 
			awesome.restart()
		end,
		{ description = "restart", group = "awesome" }),
	akey({ modkey, shiftkey }, "y",
		function()
			awesome.quit()
		end,
		{ description = "quit", group = "awesome" }),
	akey({ modkey, shiftkey }, "c",
		function()
			hotkeys_popup.show_help()
		end,
		{ description = "hotkeys", group = "awesome" }),
	akey({ modkey, shiftkey }, "v",
		function()
			c.widgets.refresh(c.screen.widgets)
		end,
		{ description = "refresh widgets", group = "awesome" }),
	akey({ modkey, shiftkey }, "m",
		lock_mouse,
		{ description = "lock mouse within client", group = "awesome" }),
	akey({ modkey, shiftkey }, "s",
		function()
			lockcmd = 'jautolock now lock',
			c.awful.spawn(lockcmd, false)
		end,
		{ description = "lock screen", group = "awesome" }),
	akey({ modkey, shiftkey }, "b",
		function()
			if jautolock_busy then
				key = 'unbusy'
			else
				key = 'busy'
			end
			jautolock_busy = not jautolock_busy

			c.awful.spawn('jautolock ' .. key, false)
			c.naughty.notify({
				title = 'jautolock',
				text = 'Entering ' .. key .. ' mode'
			})
		end,
		{ description = "(un)busy jautolock", group = "awesome" })

)
-- }}}

-- {{{ Applications
bindings.keys.apps = gtable.join(
	-- Commonly used programs
	akey({ modkey, altkey }, "m",
		function()
			c.awful.spawn(mail)
		end,
		{ description = "mail (geary)", group = "application" }),
	akey({ modkey, altkey }, "r",
		function()
			c.awful.spawn(c.apps.filemanager)
		end,
		{ description = "filemanager (ranger)", group = "application" }),
	akey({ modkey, altkey }, "n",
		function()
			c.awful.spawn(c.apps.filemanager_gui)
		end,
		{ description = "filemanager (nautilus)", group = "application"}),
	akey({ modkey, altkey }, "f",
		function()
			c.awful.spawn(c.apps.browser)
		end,
		{ description = "browser (firefox)", group = "application" }),
	akey({ modkey, }, "Return",
		function()
			c.awful.spawn(c.apps.terminal)
		end,
		{ description = "terminal@elli.lan", group = "application" }),
	akey({ modkey, shiftkey }, "Return",
		function()
			c.awful.spawn(c.apps.terminal .. ' -e ssh elli.lan')
		end,
		{ description = "terminal", group = "application" })
)
-- }}}

-- {{{ Rofi
function spawn_rofi(modes)
	if type(modes) == 'table' then
		c.awful.spawn("rofi -combi-modi " .. table.concat(modes, ",")
			.. " -show combi")
	else
		c.awful.spawn("rofi -show " .. modes, false)
	end
end

bindings.keys.rofi = gtable.join(
	akey({ modkey }, spacekey,
		function()
			spawn_rofi({"drun", "run"})
		end),
	akey({ modkey, shiftkey }, spacekey,
		function()
			spawn_rofi("window")
		end),
	akey({ modkey, altkey }, spacekey,
		function()
			spawn_rofi("ssh")
		end)
)
-- }}}

-- {{{ Tags
bindings.keys.tags = { }
for s in screen do
	for i,_ in pairs(c.tags.keys[s.index]) do
		bindings.keys.tags = gtable.join(bindings.keys.tags,
			akey({ modkey }, c.tags.keys[s.index][i],
				function()
					c.awful.screen.focus(s)
					local tag = s.tags[i]
					if tag then
						tag:view_only()
					end
				end,
				{ description = "show " .. c.tags.names[s.index][i], group = "tag" }),
			akey({ modkey, shiftkey }, c.tags.keys[s.index][i],
				function()
					if client.focus then
						local tag = s.tags[i]
						if tag then
							client.focus:move_to_tag(tag)
							-- c.awful.screen.focus(screen)
						end
					end
				end,
				{ description = "move client to  "
					.. c.tags.names[s.index][i],
					group = "tag" })
		)
	end
end
-- }}}

-- {{{ Clients
bindings.keys.client = gtable.join(
	-- Swap with h/j/k/l
	akey({ modkey, shiftkey }, "j",
		function()
			c.awful.client.swap.global_bydirection("down")
		end,
		{ description = "move down", group = "client" }),
	akey({ modkey, shiftkey }, "k",
		function()
			c.awful.client.swap.global_bydirection("up")
		end,
		{ description = "move up", group = "client" }),
	akey({ modkey, shiftkey }, "l",
		function()
			c.awful.client.swap.global_bydirection("right")
		end,
		{ description = "move right", group = "client" }),
	akey({ modkey, shiftkey }, "h",
		function()
			c.awful.client.swap.global_bydirection("left")
		end,
		{ description = "move left", group = "client" }),

	-- Jump to clients with h/j/k/l
	akey({ modkey, }, "j",
		function()
			c.awful.client.focus.global_bydirection("down")
			if client.focus then 
				client.focus:raise()
			end
		end,
		{ description = "focus down", group = "client" }),
	akey({ modkey }, "k",
		function()
			c.awful.client.focus.global_bydirection("up")
			if client.focus then
				client.focus:raise()
			end
		end,
		{ description = "focus up", group = "client" }),
	akey({ modkey }, "h",
		function()
			c.awful.client.focus.global_bydirection("left")
			if client.focus then
				client.focus:raise()
			end
		end,
		{ description = "focus left", group = "client" }),
	akey({ modkey }, "l",
		function()
			c.awful.client.focus.global_bydirection("right")
			if client.focus then
				client.focus:raise()
			end
		end,
		{ description = "focus right", group = "client" }),

	-- Manage clients
	akey({ modkey, }, "u",
		function()
			client.focus.fullscreen = not client.focus.fullscreen
		end,
		{ description = "fullscreen", group = "client" }),
	akey({ modkey, }, "c",
		function()
			client.focus:kill()
		end,
		{ description = "kill", group = "client" }),
	akey({ modkey }, "f", 
		function()
			client.focus.floating = not client.focus.floating
		end,
		{ description = "float", group = "client" }),
	akey({ modkey, }, "s",
		function()
			client.focus.sticky = not client.focus.sticky
		end,
		{ description = "sticky", group = "client" }),
	akey({ modkey, }, "m",
		function()
			client.focus.maximized = not client.focus.maximized
		end,
		{ description = "maximize", group = "client" })
)

bindings.buttons.client = gtable.join(
	abutton({ }, 1,
		function(c)
			client.focus = c; c:raise()
		end),
	abutton({ modkey }, 1, c.awful.mouse.client.move),
	abutton({ modkey }, 3, c.awful.mouse.client.resize)
)
-- }}}

-- {{{ Layouts

bindings.keys.layouts = gtable.join(
	-- Cycle / Uncycle layouts
	akey({ modkey }, "n",
		function()
			c.awful.layout.inc(c.layouts.list, 1)
		end, 
		{ description = "cycle layouts", group = "layout" }),
	akey({ modkey }, "p",
		function()
			c.awful.layout.inc(c.layouts.list, -1)
		end, 
		{ description = "uncycle layouts", group = "layout" }),
	-- Change columns / master
	akey({ modkey, altkey }, "l",
		function()
			c.awful.tag.incncol(1) 
		end,
		{ description = "increase column", group = "layout" }),
	akey({ modkey, altkey }, "h",
		function()
			c.awful.tag.incncol(-1) 
		end, 
		{ description = "descrease column", group = "layout" }),
	akey({ modkey, altkey }, "j",
		function()
			c.awful.tag.incnmaster(1)
		end, 
		{ description = "increase master", group = "layout" }),
	akey({ modkey, altkey }, "k",
		function()
			c.awful.tag.incnmaster(-1)
		end, 
		{ description = "descrease master", group = "layout" }),
	-- Change width / height
	akey({ modkey, ctrlkey }, "h",
		function()
			c.awful.tag.incmwfact(-0.05)
		end,
		{ description = "decrease width", group = "layout" }),
	akey({ modkey, ctrlkey }, "l",
		function()
			c.awful.tag.incmwfact(0.05)
		end, 
		{ description = "increase width", group = "layout" }),
	akey({ modkey, ctrlkey }, "k",
		function()
			c.awful.client.incwfact(-0.05)
		end,
		{ description = "decrease height", group = "layout" }),
	akey({ modkey, ctrlkey }, "j",
		function()
			c.awful.client.incwfact(0.05)
		end, 
		{ description = "increase height", group = "layout" })
)
-- }}}

-- {{{ Widgets

-- {{{ Arch
bindings.buttons.arch = gtable.join(
	abutton({ }, 1,
		function()
			local command = c.apps.terminal .. " -e sudo pacman -Syu"
			c.awful.spawn(command)
		end),
	abutton({ }, 3,
		function()
			local command = c.apps.terminal .. " -e pacaur -Syu"
			c.awful.spawn(command)
		end)
)
-- }}}

-- {{{ Volume
bindings.buttons.volume = gtable.join(
	c.awful.button({ }, 1,
		function(t)
			c.awful.spawn(volume_mixer)
		end),
	c.awful.button({ }, 3,
		function(t)
			c.screen.widgets.volume.mute()
		end),
	c.awful.button({ }, 4,
		function(t)
			c.screen.widgets.volume.up()
		end),
	c.awful.button({ }, 5,
		function(t)
			c.screen.widgets.volume.down()
		end)
)
-- }}}

-- {{{ Layoutbox
bindings.buttons.layoutbox = gtable.join(
	abutton({ }, 1,
	function()
		c.awful.layout.inc(c.layouts.list, 1)
	end),
	abutton({ }, 3,
	function()
		c.awful.layout.inc(c.layouts.list, -1)
	end),
	abutton({ }, 4,
	function()
		c.awful.layout.inc(c.layouts.list, 1)
	end),
	abutton({ }, 5,
	function()
		c.awful.layout.inc(c.layouts.list, -1)
	end)
)
-- }}}

-- {{{ Taglist
bindings.buttons.taglist = gtable.join(
	abutton({ }, 1,
		function (t)
				t:view_only()
		end),
	abutton({ c.common.shiftkey }, 1,
		function (t)
			client.focus:move_to_tag(t)
		end),
	abutton({ }, 4,
		function (t)
			c.awful.tag.viewnext(t.screen)
		end),
	abutton({ }, 5,
		function (t)
			c.awful.tag.viewprev(t.screen)
		end)
)

-- }}}

-- }}}

function bindings.init()
	bindings.keys.root = gtable.join(
		bindings.keys.awesome,
		bindings.keys.apps,
		bindings.keys.tags,
		bindings.keys.client,
		bindings.keys.layouts,
		bindings.keys.rofi,
		bindings.keys.misc
	)
	bindings.buttons.root = gtable.join()
	root.keys(bindings.keys.root)
	root.buttons(bindings.buttons.root)
end

return bindings


-- vim: filetype=lua:foldmethod=marker
