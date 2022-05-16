####################################
# QTILE CONFIG BY MAARTEN BRUYNINX #
####################################

# Imports
from typing import List, Text  # noqa: F401
from libqtile import bar, layout, widget, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile import hook
import os
import subprocess

from colors.blackqtile import *

# Some quick settings
mod = "mod4"
terminal = "alacritty"
browser = "chromium"
editor = "code"

home_dir = os.path.expanduser("~")

@hook.subscribe.startup_once
def autostart():
    os.system("sh ~/.config/qtile/startup.sh")
    return

# Keybinds
keys = [
    # Switch between windows
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next()),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "Left", lazy.layout.swap_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.swap_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),


    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "Left", lazy.layout.shrink_main(),
        desc="Grow window to the left"),
    Key([mod, "control"], "Right", lazy.layout.grow_main(),
        desc="Grow window to the right"),
    Key([mod, "control"], "Down", lazy.layout.shrink(),
        desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),


    Key([mod], 'c', lazy.spawn(browser)),
    Key([mod], 'e', lazy.spawn(editor)),
    Key([mod], "Return", lazy.spawn(terminal)),

    Key([mod], "s", lazy.spawn("rofi -modi drun -show")),
    Key([mod], "p", lazy.spawn("rofi -modi \"p:~/.config/qtile/rofi/power.py\" -show p")),
    Key([mod], "d", lazy.spawn("rofi -modi \"p:~/.config/qtile/rofi/tag.py\" -show p")),
    Key([mod], "q", lazy.spawn("rofi -modi \"p:~/.config/qtile/rofi/window.py\" -show p")),

    Key([mod], "w", lazy.window.kill()),

    Key([mod, "control"], "r", lazy.restart()),
]

# Groups
# I have 9 groups declared, but will autohide the ones not in use
group_names = [
    ("1", {'layout': 'Columns'}),
    ("2", {'layout': 'Columns'},),
    ("3", {'layout': 'Columns'}),
    ("4", {'layout': 'Columns'}),
    ("5", {'layout': 'Columns'}),
    ("6", {'layout': 'Columns'}),
    ("7", {'layout': 'Columns'}),
    ("8", {'layout': 'Columns'}),
    ("9", {'layout': 'Columns'})
]

groups = [Group(name, **kwargs) for name, kwargs in group_names]
for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group 

# Layout theme defines how to place windows in my layout (I only use one layout)
layout_theme = {
    "border_width": 1,
    "margin": 15,
    "border_focus": b,
    "border_normal": background_dark,
}

layouts = [
    layout.MonadTall(**layout_theme),
]

screens = [
    
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
    Click([mod, 'shift'], "Button1", lazy.window.disable_floating()),
    Click([mod], "Button1", lazy.window.bring_to_front()) 
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = False
bring_front_click = True
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
], **layout_theme)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

wmname = "LG3D"
