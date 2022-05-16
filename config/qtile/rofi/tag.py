#!/usr/bin/env python

import os
import rofi
import libqtile
from libqtile.command.client import InteractiveCommandClient

c = InteractiveCommandClient()

class R(rofi.Rofi):
    def rofi_init(self):
        notused =   ''
        used =      ''

        _, groups = c.items("group")
        for g in groups:
            if len(c.group[g].info()['windows']) == 0: self.print_row("{0} {1}".format(notused, g), info=g)
            else: self.print_row("{0} {1}".format(used, g), info=g)

    def rofi_process(self, arg):
        c.group[self.info].toscreen()

    def rofi_other(self, status):
        self.rofi_init()

r = R()