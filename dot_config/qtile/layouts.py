from libqtile import layout


class Layouts:
    def __init__(self):
        self.default = {
            "border_width": 4,
            "margin": 12,
            "border_focus": "#F24A72",
            "border_normal": "#dfdfde"
        }

    def init_layouts(self):
        """
        Returns the layouts variable
        """
        layouts = [
            layout.MonadTall(**self.default),
            layout.Max(**self.default),
            # layout.Stack(num_stacks=2),
            # Try more layouts by unleashing below layouts.
            # layout.Bsp(**self.default),
            # layout.floating.Floating(**self.default),
            # layout.Columns(**self.default),
            # layout.Matrix(**self.default),
            # layout.MonadWide(**self.default),
            # layout.RatioTile(**self.default),
            # layout.Tile(**self.default),
            # layout.Zoomy(**self.default),
        ]
        return layouts
