#!/usr/bin/env python

import os
import rofi
import libqtile
from libqtile.command.client import InteractiveCommandClient

c = InteractiveCommandClient()

class R(rofi.Rofi):
    def rofi_init(self):
        _, windows = c.items("window")
        for w in windows:
            self.print_row("{0}: {1}".format(c.window[w].info()['wm_class'][1], c.window[w].info()['name']), info=str(w))

    def rofi_process(self, arg):
        c.group[c.window[int(self.info)].info()["group"]].toscreen()

    def rofi_other(self, status):
        self.rofi_init()

        

r = R()