-- Layoutbox

-- {{{ Widget implementation
local capi = { screen = screen, tag = tag }
local layout = c.awful.layout
local tooltip = c.awful.tooltip
local surface = c.gears.surface
local boxes = {}


local function get_screen(s)
	return s and capi.screen[s]
end

local function new()
    local wt = c.wibox.widget.textbox()
    local wm, wbk, wb = c.widgets.wrap(wt)
    wt:buttons(c.bindings.buttons.layoutbox)
    w = {
        wt = wt,
        wm = wm,
        wbk = wbk,
        wb = wb
    }

    return w
end

local function layoutbox(screen)
	screen = get_screen(screen) or 1

	-- Do we already have a layoutbox for this screen?
	local w = boxes[screen.index]
	if not w then
	    w = new()
		boxes[screen.index] = w
	end

	return w
end

local function update(screen)
	screen = get_screen(screen)
	local name = layout.getname(layout.get(screen))
    local w = layoutbox(screen)

	local color = c.beautiful.layout.colors[name]
	local icon = c.beautiful.layout.icons[name]
    local text = c.beautiful.layout.shortnames[name]
    if not (icon and text and color) then
        icon = 0x00e009
        color = c.beautiful.danger
        text = "??"
    end
    icon = c.beautiful.iconify(icon, color)
    repr = icon .. " " .. text
	w.wt:set_markup(repr)
    w.wb:set_color(color)
end

capi.tag.connect_signal("property::selected", function(t) update(t.screen) end)
capi.tag.connect_signal("property::layout", function(t) update(t.screen) end)
capi.tag.connect_signal("property::screen",
    function()
        for s, _ in pairs(boxes) do
            if s.valid then
                update(s)
            end
        end
    end
)

return function(s)
    local w = layoutbox(s)
    return w.wm
end


-- vim: filetype=lua:foldmethod=marker
