from libqtile.config import Group
from icons import group_icons


class CreateGroups:
    group_names = group_icons

    def init_groups(self):
        """
        Return the groups of Qtile
        """
        #### First and last
        groups = [
            Group(name, layout="monadtall")
            for name in self.group_names
        ]
        return groups