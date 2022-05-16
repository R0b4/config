import os
import sys

class Rofi:
    info = None
    data = None

    def rofi_init(self):
        pass

    def rofi_process(self, arg):
        pass

    def rofi_other(self, status):
        pass

    def print_option(self, name: str, value: str):
        sys.stdout.buffer.write("\0{0}\x1f{1}\n".format(name, value).encode("utf-8"), end='')

    def print_row(self, value: str, icon: str = None, meta: str = None, nonselectable: bool = None, info: str = None):
        sys.stdout.buffer.write(value.encode("utf-8"))
        opt = []

        if icon != None: opt.append(["icon", icon])
        if meta != None: opt.append(["meta", meta])
        if nonselectable != None: opt.append(["nonselectable", str(nonselectable)])
        if info != None: opt.append(["info", info])

        if len(opt) != 0: sys.stdout.buffer.write(b'\0')

        for i in range(len(opt)):
            sys.stdout.buffer.write(opt[i][0].encode("utf-8"))
            sys.stdout.buffer.write(b'\x1f')
            sys.stdout.buffer.write(opt[i][1].encode("utf-8"))
            if i != (len(opt) - 1): sys.stdout.buffer.write(b'\x1f')
        
        sys.stdout.buffer.write(b'\n')

    def __init__(self):
        rofiret = os.getenv("ROFI_RETV")
        self.info = os.getenv("ROFI_INFO")
        self.data = os.getenv("ROFI_DATA")

        if (rofiret == None) or (int(rofiret) == 0):
            self.rofi_init()
        elif int(rofiret) == 1:
            self.rofi_process(sys.argv[1])
        else:
            self.rofi_other(int(rofiret))