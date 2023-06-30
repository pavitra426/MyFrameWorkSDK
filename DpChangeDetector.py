import ctypes
import math
import tkinter

def getChange():
    MM_TO_IN = 0.0393700787

    ctypes.windll.shcore.SetProcessDpiAwareness(1)

    root = tkinter.Tk()

    dpi = ctypes.windll.user32.GetDpiForWindow(root.winfo_id())
    dc = ctypes.windll.user32.GetDC(root.winfo_id())
    mw = ctypes.windll.gdi32.GetDeviceCaps(dc, 4) * MM_TO_IN
    mh = ctypes.windll.gdi32.GetDeviceCaps(dc, 6) * MM_TO_IN
    dw = ctypes.windll.gdi32.GetDeviceCaps(dc, 8)
    dh = ctypes.windll.gdi32.GetDeviceCaps(dc, 10)
    root.destroy()

    hdpi, vdpi = dw / mw, dh / mh
    ddpi = math.hypot(dw, dh) / math.hypot(mw, mh)
    DiagonalDpi = round(ddpi)

    return DiagonalDpi, dpi
