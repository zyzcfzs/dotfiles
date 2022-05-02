"""
MODIFY THIS FILE TO CREATE CUSTOM KEYBINDINGS

Keybindings are configured with tuples, inside Predifined lists Variables

Modifier -> list() -> Ex: [MOD, CONTROL]

Key -> str() -> Ex: 'j'

Command -> str() -> Ex: vscode

(Modifier, Key, Command)
"""

from libqtile.confreader import ConfigError

# Import default mod keys
from keys.default import *


from os.path import expanduser

HOME = expanduser("~")

# Define constants here
TERMINAL = "alacritty -e tmux attach-session"


# Basic window manager movements


# Qtile shutdown/restart keys
SHUTDOWN_MODIFIER = [MOD]
RESTART = "r"
SHUTDOWN = "q"


# Group movement keys:
GROUPS_KEY = CONTROL
SWAP_GROUP_KEY = SHIFT

NEXT_GROUP = "period"
PREV_GROUP = "comma"


# ------------ Hardware Configs ------------
HARDWARE_KEYS = [
    # (Modifier, Key, Command)
    # Volume
    ([], "XF86AudioLowerVolume", "pactl set-sink-volume @DEFAULT_SINK@ -5%"),
    ([], "XF86AudioRaiseVolume", "pactl set-sink-volume @DEFAULT_SINK@ +5%"),
    ([], "XF86AudioMute", "pactl set-sink-mute @DEFAULT_SINK@ toggle"),
    # Brightness
    ([], "XF86MonBrightnessUp", "brightnessctl set +10%"),
    ([], "XF86MonBrightnessDown", "brightnessctl set 10%-"),
]


# (Modifier, Key, Command)
APPS = [
    ([MOD], "Return", TERMINAL),
    ([MOD, ALT], "e", "nautilus"),
    ([MOD], "b", "chromium"),
    ([MOD, ALT], "v", TERMINAL + " -e vim"),
    ([MOD, ALT], "f", "firefox"),
    ([MOD], "c", "code"),
    ([MOD, ALT], "l", "librewolf"),
    ([MOD, ALT], "a", "pavucontrol"),
    # Media hotkeys
    ([MOD], "Up", "pactl set-sink-volume @DEFAULT_SINK@ +2%"),
    ([MOD], "Down", "pactl set-sink-volume @DEFAULT_SINK@ -2%"),
    ([ALT], "space", "rofi -show combi"),
    # Screenshots
    ([MOD], "Print", "flameshot gui"),
    (
        [MOD, SHIFT],
        "Print",
        TERMINAL + " -e flameshot full -p /home/zyzcfzs/Pictures/flameshot",
    ),
]

##########################
# Your custom keys here  #
##########################

CUSTOM_SPAWN_KEYS = []


SPAWN_KEYS = HARDWARE_KEYS + APPS + CUSTOM_SPAWN_KEYS

SPAWN_CMD_KEYS = [
    ([SHIFT], "Print", f"xfce4-screenshooter -f -s {HOME}/Pictures/Screenshots/"),
]
