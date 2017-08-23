-- Layoutbox

-- {{{ Widget implementation
local capi = { screen = screen, tag = tag }
local layout = c.awful.layout
local tooltip = c.awful.tooltip
local surface = c.gears.surface

local function get_screen(s)
	return s and capi.screen[s]
end

local boxes = nil

local function update(w, screen)
	screen = get_screen(screen)
	local name = layout.getname(layout.get(screen))
	w._layoutbox_tooltip:set_text(name or "[no name]")

	local repr = c.beautiful["layout_repr_" .. name]
		or c.beautiful.iconify(0x00e009) .. " ?"
	w:set_markup(repr)
end

local function update_from_tag(t)
	local screen = get_screen(t.screen)
	local w = boxes[screen]
	if w then
		update(w, screen)
	end
end

local function new(screen)
	screen = get_screen(screen or 1)

	-- Do we already have the update callbacks registered?
	if boxes == nil then
		boxes = setmetatable({}, { __mode = "kv" })
		capi.tag.connect_signal("property::selected", update_from_tag)
		capi.tag.connect_signal("property::layout", update_from_tag)
		capi.tag.connect_signal("property::screen", function()
			for s, w in pairs(boxes) do
				if s.valid then
					update(w, s)
				end
			end
		end)
	end

	-- Do we already have a layoutbox for this screen?
	local w = boxes[screen]
	if not w then
		w = c.wibox.widget.textbox()
		w._layoutbox_tooltip = tooltip{
			objects = {w},
			delay_show = 1
		}

		update(w, screen)
		boxes[screen] = w
	end

	return w
end
-- }}}

local function layoutbox(s)
	local w = new(s)
	w = c.widgets.wrap(w)
	w:buttons(c.bindings.buttons.layoutbox)
	return w
end

return layoutbox


-- vim: filetype=lua:foldmethod=marker
