#!/usr/bin/env python

import os
import rofi
import libqtile
from libqtile.command.client import InteractiveCommandClient

c = InteractiveCommandClient()

class R(rofi.Rofi):
    def rofi_init(self):
        self.print_row("shutdown", info=str(0))
        self.print_row("reboot", info=str(1))
        self.print_row("quit", info=str(2))

    def rofi_process(self, arg):
        opt = int(self.info)
        if opt == 0:
            os.system("shutdown now")
        elif opt == 1:
            os.system("reboot")
        elif opt == 2:
            c.shutdown()

    def rofi_other(self, status):
        self.rofi_init()

        

r = R()