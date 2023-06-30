from colorharmonies import *


def rgb_to_hex(rgb):
    r, g, b = rgb
    return "#" + '%02x%02x%02x' % (r, g, b)


def hex_to_rgb(value):
    value = value.lstrip('#')
    lv = len(value)
    return tuple(int(value[i:i + lv // 3], 16) for i in range(0, lv, lv // 3))


def getComplementaryColor(C):
    Co = hex_to_rgb(C)
    CO = Color(Co, "", "")
    COL = complementaryColor(CO)
    return rgb_to_hex(COL)

