---------------------------------------------------------------------------
-- A circular chart (arc chart) container.
--
-- It can contain a central widget (or not) and display multiple values.
--
--
--
--<object class=&#34img-object&#34 data=&#34../images/AUTOGEN_wibox_container_defaults_arcchart.svg&#34 alt=&#34Usage example&#34 type=&#34image/svg+xml&#34></object>
--
-- @author Emmanuel Lepage Vallee &lt;elv1313@gmail.com&gt;
-- @copyright 2013 Emmanuel Lepage Vallee
-- @containermod wibox.container.arcchart
-- @supermodule wibox.widget.base
---------------------------------------------------------------------------

local setmetatable = setmetatable
local base      = require("wibox.widget.base")
local shape     = require("gears.shape"      )
local gtable    = require( "gears.table"     )
local color     = require( "gears.color"     )
local beautiful = require("beautiful"        )


local arcchart = { mt = {} }

--- The progressbar border background color.
-- @beautiful beautiful.arcchart_border_color
-- @param color

--- The progressbar foreground color.
-- @beautiful beautiful.arcchart_color
-- @param color

--- The progressbar border width.
-- @beautiful beautiful.arcchart_border_width
-- @param number

--- The padding between the outline and the progressbar.
-- @beautiful beautiful.arcchart_paddings
-- @tparam[opt=0] table|number paddings A number or a table
-- @tparam[opt=0] number paddings.top
-- @tparam[opt=0] number paddings.bottom
-- @tparam[opt=0] number paddings.left
-- @tparam[opt=0] number paddings.right

--- The arc thickness.
-- @beautiful beautiful.arcchart_thickness
-- @tparam number arcchart_thickness

--- If the chart has rounded edges.
-- @beautiful beautiful.arcchart_rounded_edge
-- @tparam boolean arcchart_rounded_edge

--- The radial background.
-- @beautiful beautiful.arcchart_bg
-- @tparam gears.color arcchart_bg

--- The (radiant) angle where the first value start.
-- @beautiful beautiful.arcchart_start_angle
-- @tparam number arcchart_start_angle

local function outline_workarea(width, height)
    local x, y = 0, 0
    local size = math.min(width, height)

    return {x=x+(width-size)/2, y=y+(height-size)/2, width=size, height=size}
end

-- The child widget area
local function content_workarea(self, width, height)
    local padding = self._private.paddings or {}
    local border_width = self:get_border_width() or 0
    local wa = outline_workarea(width, height)
    local thickness = math.max(border_width, self:get_thickness() or 5)

    wa.x      = wa.x + (padding.left or 0) + thickness + 2*border_width
    wa.y      = wa.y + (padding.top  or 0) + thickness + 2*border_width
    wa.width  = wa.width  - (padding.left or 0) - (padding.right  or 0)
        - 2*thickness - 4*border_width
    wa.height = wa.height - (padding.top  or 0) - (padding.bottom or 0)
        - 2*thickness - 4*border_width

    return wa
end

-- Draw the radial outline and progress
function arcchart:after_draw_children(_, cr, width, height)
    cr:restore()

    local values  = self:get_values() or {}
    local border_width = self:get_border_width() or 0
    local thickness = math.max(border_width, self:get_thickness() or 5)

    local offset = thickness + 2*border_width

    -- Draw a circular background
    local bg = self:get_bg()
    if bg then
        cr:save()
        cr:translate(offset/2, offset/2)
        shape.circle(
            cr,
            width-offset,
            height-offset
        )
        cr:set_line_width(thickness+2*border_width)
        cr:set_source(color(bg))
        cr:stroke()
        cr:restore()
    end

    if #values == 0 then
        return
    end

    local wa = outline_workarea(width, height)
    cr:translate(wa.x+border_width/2, wa.y+border_width/2)

    -- Get the min and max value
    --local min_val = self:get_min_value() or 0 --TODO support min_values
    local max_val = self:get_max_value()
    local sum = 0

    for _, v in ipairs(values) do
        sum = sum + v
    end

    if not max_val then
        max_val = sum
    end

    max_val = math.max(max_val, sum)

    local use_rounded_edges = sum ~= max_val and self:get_rounded_edge()

    -- Fallback to the current foreground color
    local colors = self:get_colors() or {}

    -- Draw the outline
    local offset_angle = self:get_start_angle() or math.pi
    local start_angle, end_angle = offset_angle, offset_angle

    for k, v in ipairs(values) do
        end_angle = start_angle + (v*2*math.pi) / max_val

        if colors[k] then
            cr:set_source(color(colors[k]))
        end

        shape.arc(cr, wa.width-border_width, wa.height-border_width,
            thickness+border_width, math.pi-end_angle, math.pi-start_angle,
            (use_rounded_edges and k == #values), (use_rounded_edges and k == 1)
        )

        cr:fill()
        start_angle = end_angle
    end

    if border_width > 0 then
        local border_color = self:get_border_color()

        cr:set_source(color(border_color))
        cr:set_line_width(border_width)

        shape.arc(cr, wa.width-border_width, wa.height-border_width,
            thickness+border_width, math.pi-end_angle, math.pi-offset_angle,
            use_rounded_edges, use_rounded_edges
        )
        cr:stroke()
    end

end

-- Set the clip
function arcchart:before_draw_children(_, cr, width, height)
    cr:save()
    local wa = content_workarea(self, width, height)
    cr:translate(wa.x, wa.y)
    shape.circle(
        cr,
        wa.width,
        wa.height
    )
    cr:clip()
    cr:translate(-wa.x, -wa.y)
end

-- Layout this layout
function arcchart:layout(_, width, height)
    if self._private.widget then
        local wa = content_workarea(self, width, height)

        return { base.place_widget_at(
            self._private.widget, wa.x, wa.y, wa.width, wa.height
        ) }
    end
end

-- Fit this layout into the given area
function arcchart:fit(_, width, height)
    local size = math.min(width, height)
    return size, size
end

--- The widget to wrap in a radial proggressbar.
-- @property widget
-- @tparam[opt=nil] widget|nil widget
-- @interface container

arcchart.set_widget = base.set_widget_common

function arcchart:get_children()
    return {self._private.widget}
end

function arcchart:set_children(children)
    self._private.widget = children and children[1]
    self:emit_signal("widget::layout_changed")
end

--- Reset this layout. The widget will be removed and the rotation reset.
-- @method reset
-- @noreturn
-- @interface container
function arcchart:reset()
    self:set_widget(nil)
end

for _,v in ipairs {"left", "right", "top", "bottom"} do
    arcchart["set_"..v.."_padding"] = function(self, val)
        self._private.paddings = self._private.paddings or {}
        self._private.paddings[v] = val
        self:emit_signal("widget::redraw_needed")
        self:emit_signal("widget::layout_changed")
    end
end

--- The padding between the outline and the progressbar.
--
--
--<object class=&#34img-object&#34 data=&#34../images/AUTOGEN_wibox_container_arcchart_paddings.svg&#34 alt=&#34Usage example&#34 type=&#34image/svg+xml&#34></object>
--
-- @property paddings
-- @tparam[opt=0] table|number paddings A number or a table
-- @tparam[opt=0] number paddings.top
-- @tparam[opt=0] number paddings.bottom
-- @tparam[opt=0] number paddings.left
-- @tparam[opt=0] number paddings.right
-- @propertytype number A single padding value for each side.
-- @propertytype table A different padding value for each side.
-- @propertyunit pixel
-- @negativeallowed false
-- @emits [opt=bob] property::paddings When the `paddings` changes.
-- @emitstparam property::paddings widget self The object being modified.
-- @emitstparam property::paddings table paddings The new paddings.
-- @usebeautiful beautiful.arcchart_paddings Fallback value when the object
--  `paddings` isn't specified.

--- The border background color.
--
-- @property border_color
-- @tparam color|nil border_color
-- @propemits true false
-- @propbeautiful

--- The arcchart values foreground colors.
--
-- @property colors
-- @tparam table colors
-- @tablerowtype An ordered list of colors for each value in arcchart.
-- @propemits true false
-- @usebeautiful beautiful.arcchart_color

--- The border width.
--
--
--
--<object class=&#34img-object&#34 data=&#34../images/AUTOGEN_wibox_container_arcchart_border_width.svg&#34 alt=&#34Usage example&#34 type=&#34image/svg+xml&#34></object>
--
--
-- @property border_width
-- @tparam[opt=0] number|nil border_width
-- @negativeallowed false
-- @propertyunit pixel
-- @propemits true false
-- @propbeautiful

--- The minimum value.
-- @property min_value
-- @tparam[opt=0] number min_value
-- @negativeallowed true
-- @propemits true false

--- The maximum value.
-- @property max_value
-- @tparam number max_value
-- @propertydefault The sum of all `values`.
-- @negativeallowed true
-- @propemits true false

--- The radial background.
--
--
--<object class=&#34img-object&#34 data=&#34../images/AUTOGEN_wibox_container_arcchart_bg.svg&#34 alt=&#34Usage example&#34 type=&#34image/svg+xml&#34></object>
--
-- @property bg
-- @tparam color|nil bg
-- @see gears.color
-- @propemits true false
-- @propbeautiful

--- The value.
--
--
--<object class=&#34img-object&#34 data=&#34../images/AUTOGEN_wibox_container_arcchart_value.svg&#34 alt=&#34Usage example&#34 type=&#34image/svg+xml&#34></object>
--
-- @property value
-- @tparam[opt=0] number value
-- @rangestart `min_value`
-- @rangestop `max_value`
-- @negativeallowed true
-- @see values
-- @propemits true false

--- The values.
-- The arcchart is designed to display multiple values at once. Each will be
-- shown in table order.
--
-- @property values
-- @tparam[opt={}] table values An ordered set of values.
-- @tablerowtype A list of numbers.
-- @propemits true false
-- @see value

--- If the chart has rounded edges.
--
--
--<object class=&#34img-object&#34 data=&#34../images/AUTOGEN_wibox_container_arcchart_rounded_edge.svg&#34 alt=&#34Usage example&#34 type=&#34image/svg+xml&#34></object>
--
-- @property rounded_edge
-- @tparam[opt=false] boolean|nil rounded_edge
-- @propemits true false
-- @propbeautiful

--- The arc thickness.
--
--
--<object class=&#34img-object&#34 data=&#34../images/AUTOGEN_wibox_container_arcchart_thickness.svg&#34 alt=&#34Usage example&#34 type=&#34image/svg+xml&#34></object>
--
-- @property thickness
-- @propemits true false
-- @tparam number|nil thickness
-- @propertyunit pixel
-- @negativeallowed false
-- @propbeautiful

--- The (radiant) angle where the first value start.
-- 
--
--<object class=&#34img-object&#34 data=&#34../images/AUTOGEN_wibox_container_arcchart_start_angle.svg&#34 alt=&#34Usage example&#34 type=&#34image/svg+xml&#34></object>
--
-- @property start_angle
-- @tparam[opt=math.pi] number start_angle
-- @rangestart 0
-- @rangestop 2*math.pi
-- @propemits true false
-- @usebeautiful beautiful.arcchart_start_angle

for _, prop in ipairs {"border_width", "border_color", "paddings", "colors",
    "rounded_edge", "bg", "thickness", "values", "min_value", "max_value",
    "start_angle" } do
    arcchart["set_"..prop] = function(self, value)
        self._private[prop] = value
        self:emit_signal("property::"..prop, value)
        self:emit_signal("widget::redraw_needed")
    end
    arcchart["get_"..prop] = function(self)
        return self._private[prop] or beautiful["arcchart_"..prop]
    end
end

function arcchart:set_paddings(val)
    self._private.paddings = type(val) == "number" and {
        left   = val,
        right  = val,
        top    = val,
        bottom = val,
    } or val or {}
    self:emit_signal("property::paddings")
    self:emit_signal("widget::redraw_needed")
    self:emit_signal("widget::layout_changed")
end

function arcchart:set_value(value)
    self:set_values {value}
end

--- Returns a new arcchart layout.
-- @tparam[opt] wibox.widget widget The widget to display.
-- @constructorfct wibox.container.arcchart
local function new(widget)
    local ret = base.make_widget(nil, nil, {
        enable_properties = true,
    })

    gtable.crush(ret, arcchart)

    ret:set_widget(widget)

    return ret
end

function arcchart.mt:__call(...)
    return new(...)
end

return setmetatable(arcchart, arcchart.mt)

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
