-- Taglist widget

-- {{{ Widget implementation
local function update(w, buttons, label, data, tags)
	local common = require("awful.widget.common")
    -- update the widgets, creating them if needed
    w:reset()
    for _, t in ipairs(tags) do
        local cache = data[t]
        local tb, tbm, tbb, bgb
        if cache then
            tb = cache.tb
            tbm = cache.tbm
			tbb = cache.tbb
			bgb = cache.bgb
        else
            tb = c.wibox.widget.textbox()
            tbm = c.wibox.container.margin(tb,
				c.beautiful.display_unit,
				c.beautiful.display_unit)
            tbb = c.wibox.container.margin(tbm)
			tbb:set_top(c.beautiful.border_width)
            tbb:buttons(common.create_buttons(buttons, t))
			bgb = c.wibox.container.background(tbb)

            data[t] = {
                tb  = tb,
                tbm = tbm,
				tbb = tbb,
				bgb = bgb
            }
        end

        local text, bg, bg_image, icon, args = label(t, tb), color, border
        args = args or {}

        color = c.beautiful.fg
		bg = c.beautiful.taglist_bg
		if t.selected then
			bg = c.beautiful.taglist_bg_selected
			border = c.beautiful.taglist_border_focus
            color = c.beautiful.fg_alt
		elseif #t:clients() == 0 then
			border = c.beautiful.taglist_border_empty
		else
			border = c.beautiful.taglist_border_occupied
		end

		if t.volatile then
			border = c.beautiful.taglist_border_volatile
		elseif c.awful.tag.getproperty(t, "urgent") then
			border = c.beautiful.taglist_border_urgent
		end

        -- The text might be invalid, so use pcall.
        if text == nil or text == "" then
            tbm:set_margins(0)
        else
            if not tb:set_markup_silently(text) then
                tb:set_markup("<i>&lt;Invalid text&gt;</i>")
            end
        end

		tbb:set_color(border)
		bgb:set_bg(bg)

        w:add(bgb)
   end
end
-- }}}

local function taglist(s)
	w = c.awful.widget.taglist(s,
		c.awful.widget.taglist.filter.all,
		c.bindings.buttons.taglist, nil, update)
	w = c.widgets.wrap(w, true)
	return w
end

return taglist
