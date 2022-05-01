import os
from libqtile import bar, widget, qtile
from libqtile.lazy import lazy
from libqtile.config import Screen
from config_keybindings import TERMINAL

# extension_defaults = widget_defaults.copy()


class MyWidgets:
    def __init__(self):
        self.colors = [
            ["#292d3e", "#292d3e"],  # panel background
            # background for current screen tab
            ["#434758", "#434758"],
            ["#ffffff", "#ffffff"],  # font color for group names
            # border line color for current tab
            ["#bc13fe", "#bc13fe"],  # Group down color
            # border line color for other tab and odd widgets
            ["#8d62a9", "#8d62a9"],
            ["#668bd7", "#668bd7"],  # color for the even widgets
            ["#ff8080", "#ff8080"],  # window name
            ["#000000", "#000000"],
            ["#AD343E", "#AD343E"],
            ["#f76e5c", "#f76e5c"],
            ["#F39C12", "#F39C12"],
            ["#F7DC6F", "#F7DC6F"],
            ["#f1ffff", "#f1ffff"],
            ["#4c566a", "#4c566a"],
            ["#6FB2D2", "#6FB2D2"],
            ["#CEF0B9", "#CEF0B9"],
            ["#464545", "#464545"],
        ]
        self.myColor = [
            "#FAC0E1",
            "#5463FF",
            "#42C2FF",
            "#D82148",
            "#FFB72B",
            "#BFFFF0",
        ]

    def init_widgets_list(self):
        """
        Function that returns the desired widgets in form of list
        """
        widgets_list = [
            widget.Sep(
                linewidth=0,
                padding=5,
                foreground=self.colors[2],
                background=self.colors[0],
            ),
            widget.GroupBox(
                font="Hack Bold Nerd Font Complete",
                fontsize=22,
                margin_y=4,
                padding_y=4,
                padding_x=10,
                borderwidth=0,
                active="#5DAE8B",
                inactive="#FF7676",
                rounded=True,
                highlight_color="#f5f5f5",
                highlight_method="line",
                urgent_alert_method="block",
                foreground="#65C18C",
                background=self.colors[0],
                disable_drag=True,
            ),
            widget.Prompt(
                prompt=lazy.spawncmd(),
                padding=5,
                foreground=self.colors[3],
                background=self.colors[1],
            ),
            widget.Spacer(length=150, background=self.colors[0]),
            widget.WindowName(
                background=self.colors[0],
                width=300,
                fontsize=14,
                foreground="#F4FCD9",
                max_chars=40,
                padding=5,
            ),
            widget.Net(
                background=self.colors[0],
                fontsize=18,
                interface="enp3s0",
                format="{down} ↓↑ {up}",
                border_width=0,
                type="line",
                line_width=2,
                graph_color="#8479E1",
            ),
            widget.CPU(
                background=self.colors[0],
                fontsize=18,
                mouse_callbacks={
                    "Button1": lambda: qtile.cmd_spawn(TERMINAL + " -e htop")
                },
                foreground="#A0F6D2",
            ),
            widget.Memory(
                background=self.colors[0],
                foreground="#9AD0EC",
                mouse_callbacks={
                    "Button1": lambda: qtile.cmd_spawn(TERMINAL + " -e htop")
                },
                padding=5,
                font="Hack Regular Nerd Font Complete",
                fontsize=18,
            ),
            widget.PulseVolume(
                foreground="#B8DFD8",
                background=self.colors[0],
                padding=10,
                font="Hack Regular Nerd Font Complete",
                fontsize=18,
                mouse_callbacks={"Button3": lambda: qtile.cmd_spawn("pavucontrol")},
            ),
            widget.CurrentLayoutIcon(
                custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                foreground=self.myColor[4],
                background=self.colors[0],
                padding=0,
                scale=0.7,
            ),
            widget.CurrentLayout(
                background=self.colors[0],
                font="Hack Regular Nerd Font Complete",
                fontsize=18,
                foreground="#FDFFA3",
                padding=5,
            ),
            widget.Clock(
                foreground="#F59AF0",
                font="Hack Regular Nerd Font Complete",
                fontsize=18,
                background=self.colors[0],
                format="%Y-%m-%d %H:%M:%S",
            ),
            widget.Wttr(
                foreground="#F8F8F8",
                background=self.colors[0],
                format="4",
                location={"waterloo": ""},
                font="Hack Regular Nerd Font Complete",
                fontsize=18,
                units="m",
                threshold=26,
                update_interval=1800,
                mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("gnome-weather")},
            ),
            widget.Spacer(length=500, background=self.colors[0]),
        ]

        return widgets_list

    def init_widgets_screen(self):
        """
        Function that returns the widgets in a list.
        It can be modified so it is useful if you  have a multimonitor system
        """
        widgets_screen = self.init_widgets_list()
        return widgets_screen

    def init_widgets_screen2(self):
        """
        Function that returns the widgets in a list.
        It can be modified so it is useful if you  have a multimonitor system
        """
        widgets_screen2 = self.init_widgets_screen()
        return widgets_screen2

    def init_screen(self):
        """
        Init the widgets in the screen
        """
        return [
            Screen(
                top=bar.Bar(widgets=self.init_widgets_screen(), opacity=1.0, size=40)
            ),
            Screen(
                top=bar.Bar(widgets=self.init_widgets_screen2(), opacity=1.0, size=40)
            ),
        ]
