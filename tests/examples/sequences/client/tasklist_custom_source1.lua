 --DOC_GEN_IMAGE --DOC_HIDE_START --DOC_NO_USAGE
local module = ...
require("ruled.client")
local awful = {
    tag    = require("awful.tag"),
    widget = {
        tasklist = require("awful.widget.tasklist")
    },
    button = require("awful.button"),
    layout = require("awful.layout")
}
require("awful.ewmh")
local wibox = require("wibox")
screen[1]:fake_resize(0, 0, 1024, 640)

awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, screen[1], awful.layout.suit.corner.nw)

local s = screen[1]
--DOC_HIDE_END

    local tasklist = awful.widget.tasklist {
        screen      = s,
        filter      = awful.widget.tasklist.filter.currenttags,
        base_layout = wibox.widget {
            spacing = 2,
            layout  = wibox.layout.fixed.horizontal,
        },
    }

    --DOC_NEWLINE
    --DOC_HIDE_START

local _tl = tasklist

function awful.spawn(name, args)
    client.gen_fake{class = name, name = name, x = 2094, y=10, width = 600, height =300, screen=args.screen}
end


--DOC_NEWLINE

module.add_event("Spawn some clients.", function()
    --DOC_HIDE_END

    -- Spawn 5 clients on screen 1.
    for i= 1, 5 do
        awful.spawn("Client #"..i, {screen = screen[1]})
    end

    --DOC_NEWLINE

    -- Make 2 clients floating.
    client.get()[2].floating = true
    client.get()[4].floating = true

    --DOC_NEWLINE

    --DOC_HIDE_START
    client.get()[2]:geometry {
        x = 150, y = 100,
    }
    client.get()[4]:geometry {
        x = 300, y = 200,
    }


    --DOC_NEWLINE
    --DOC_HIDE_START

    client.get()[2]:activate {}
    client.get()[2].color = "#ff777733"
end)

--DOC_NEWLINE
module.display_tags()
module.display_widget(_tl, nil, 22)

module.add_event("Set a custom source function.", function()
    --DOC_HIDE_END
    -- Only select the floating clients for the tasklist screen.
    tasklist.source = function(screen)
        local ret = {}

        --DOC_NEWLINE
        for _, c in ipairs(screen.clients) do
            if c.floating then
                table.insert(ret, c)
            end
        end
        --DOC_NEWLINE

        return ret
    end
    --DOC_HIDE_START
end)

module.display_widget(_tl, nil, 22)

module.execute { display_screen = true , display_clients     = true,
                 display_label  = false, display_client_name = true,
                 display_mouse  = true ,
}
