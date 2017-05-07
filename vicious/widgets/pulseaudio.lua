---------------------------------------------------
-- Licensed under the GNU General Public License v2
--  * (c) 2010, Adrian C. <anrxc@sysphere.org>
---------------------------------------------------

-- {{{ Grab environment
local tonumber = tonumber
local io = { popen = io.popen }
local setmetatable = setmetatable
local string = { match = string.match }
local helpers = require("vicious.helpers")
-- }}}


-- Volume: provides volume levels and state of requested ALSA mixers
-- vicious.widgets.volume
local volume = {}


-- {{{ Volume widget type
local function worker(format, warg)
    if not warg then return end

    local mixer_state = {
        ["on"]  = "♫", -- "",
        ["off"] = "♩"  -- "M"
    }

    -- Get mixer control contents
    local f = io.popen("pactl list-sink-inputs "
		.. "| grep '#" .. helpers.shellquote(warg) .. "' -A 100 "
		.. "| grep -E 'Volume:|Mute:' | head -n 2")
    local mixer = f:read("*all")
    f:close()

    -- Capture mixer control state:          [5%] ... ... [on]
    local mute, volu = string.match(mixer, " *Mute: ([%w]+).*[%d]+ / ([%d]+)%%.*")
    -- Handle mixers without data
    if volu == nil then
       return {0, mixer_state["off"]}
    end

    -- Handle mixers without mute
    if mute == "" and volu == "0"
    -- Handle mixers that are muted
    or mute == "off" then
       mute = mixer_state["off"]
    else
       mute = mixer_state["on"]
    end

    return {tonumber(volu), mute}
end
-- }}}

return setmetatable(volume, { __call = function(_, ...) return worker(...) end })
