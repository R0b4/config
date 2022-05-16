--[[

     Powerarrow Awesome WM theme
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")

local math, string, os = math, string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local colors = {}
colors.bg = "#242936"
colors.fg = "#ffffff"

colors.black = "#30304D"
colors.red = "#ff6666"
colors.green = "#d5ff80"
colors.yellow = "#ffd173"
colors.blue = "#73d0ff"
colors.magenta = "#dfbfff"
colors.cyan = "#98e6ca"
colors.white = "#fafafa"


local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/mytheme"
--theme.wallpaper                                 = theme.dir .. "/starwars.jpg"
theme.font                                      = "FiraCode Nerd Font 5"
theme.taglist_font                              = theme.font
theme.fg_normal                                 = colors.fg
theme.fg_focus                                  = "#A77AC4"
theme.fg_urgent                                 = "#b74822"
theme.bg_normal                                 = colors.bg
theme.bg_focus                                  = "#FF79C6"
theme.bg_urgent                                 = "#3F3F3F"
theme.taglist_fg_focus                          = colors.bg
theme.taglist_bg_focus                          = colors.magenta
theme.border_width                              = 1
theme.border_normal                             = colors.bg
theme.border_focus                              = colors.magenta
theme.border_marked                             = colors.magenta
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = 20
theme.menu_width                                = 140
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note.png"
theme.widget_music_pause                        = theme.dir .. "/icons/pause.png"
theme.widget_music_stop                         = theme.dir .. "/icons/stop.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.widget_task                               = theme.dir .. "/icons/task.png"
theme.widget_scissors                           = theme.dir .. "/icons/scissors.png"
theme.widget_weather                            = theme.dir .. "/icons/dish.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 4
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"


local markup = lain.util.markup
local separators = lain.util.separators


-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch(
    "date +'%a %d %b %R'", 60,
    function(widget, stdout)
        widget:set_markup(markup.fontfg(theme.font, colors.magenta, "  " .. stdout))
    end
)

-- ALSA volume
theme.volume = lain.widget.alsabar({
    --togglechannel = "IEC958,3",
    notification_preset = { font = theme.font, fg = theme.fg_normal },
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, colors.green, "  " .. mem_now.used .. "MB "))
    end
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, colors.green, " 龍 " .. cpu_now.usage .. "% "))
    end
})

local battery_icons = {
    "", "", "", "", "", "", "", "", "", "", ""
}

local mybattery = awful.widget.watch(
    "bash -c 'cat /sys/class/power_supply/BAT0/capacity /sys/class/power_supply/BAT0/status'",
    2,
    function(widget, stdout)
        local lines = {}
        for s in stdout:gmatch("[^\r\n]+") do
            table.insert(lines, s)
        end

        local cap = tonumber(lines[1])
        local status = lines[2]

        local bticon = battery_icons[cap // 10 + 1]
        if status == "Charging" then
            bticon = ""
        end

        widget:set_markup(markup.fontfg(theme.font, colors.yellow, " " .. bticon .. " " .. cap .. "% "))
    end
)

-- ALSA volume
theme.volume = lain.widget.alsa({
    settings = function()
        local volume = tonumber(volume_now.level)
        local icon
        if volume_now.status == "off" then
            icon = "ﱝ"
        elseif volume == 0 then
            icon = "奄"
        elseif tonumber(volume_now.level) <= 50 then
            icon = "奔"
        else
            icon = "墳"
        end

        widget:set_markup(markup.fontfg(theme.font, colors.red, " " .. icon .. " " .. volume_now.level .. "% "))
    end
})

-- Net
local net = lain.widget.net({
    wifi_state = "on",
    eth_state = "on",
    notify = "off",
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, colors.blue,  " 直  " .. net_now.received .. " ↓↑ " .. net_now.sent .. " "))
    end
})

-- Separators
local arrow = separators.arrow_left

function theme.at_screen_connect(s)

    -- All tags open with layout 1
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    --s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 25, bg = theme.bg_normal .. "0", fg = theme.fg_normal })

    local ca = colors.green
    local cb = colors.blue

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --spr,
            s.mytaglist
        },
        nil,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,

            wibox.container.constraint(mem.widget, "exact", 70, 20),
            wibox.container.constraint(cpu.widget, "exact", 60, 20),
            wibox.container.constraint(net.widget, "exact", 120, 20),
            wibox.container.constraint(clock, "exact", 140, 20)

        },
    }
end

return theme
