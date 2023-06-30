from scss import Scss

import ColorHarmonySender

css = Scss()


def rgb_to_hex(rgb):
    r, g, b = rgb
    return "#" + '%02x%02x%02x' % (r, g, b)


def hex_to_rgb(value):
    value = value.lstrip('#')
    lv = len(value)
    return list(int(value[i:i + lv // 3], 16) for i in range(0, lv, lv // 3))


def First():
    ListOfColors = []
    with open("../App/Theme/Theme.ThemeFile", "r") as ThemeFile:
        for lines in ThemeFile:
            for words in lines.split("$"):
                if 'PrimaryColor' in words:
                    ListOfColors.append(words[-7:])

    PRIM = ListOfColors[0]
    pri = PRIM[1:]
    F2 = pri[:2]
    S2 = pri[2:4]
    T2 = pri[4:]

    PRI = "#" + F2 + S2 + T2
    SEC = "#" + T2 + F2 + S2
    TER = "#" + S2 + T2 + F2
    COM = ColorHarmonySender.getComplementaryColor(PRI)

    ReplaceThemeColor(hex_to_rgb(PRI), hex_to_rgb(SEC), hex_to_rgb(TER), hex_to_rgb(COM))


def ReplaceThemeColor(PrimaryColor, SecondaryColor, TertiaryColor, ComplementaryColor):
    ListToReplace = {}
    with open("style.scss", "r") as scssr:
        for lines in scssr:
            for word in lines.split(";"):
                if '$Color' and 'rgba' in word:
                    W = word
                    if 'Primary' in W:
                        word += ";"
                        ListToReplace[word] = PrimaryColor
                    if 'Secondary' in W:
                        word += ";"
                        ListToReplace[word] = SecondaryColor
                    if 'Tertiary' in W:
                        word += ";"
                        ListToReplace[word] = TertiaryColor
                    if 'Complementary' in W:
                        word += ";"
                        ListToReplace[word] = ComplementaryColor

    with open("style.scss", "r") as file:
        MainData = file.read()
        for words in ListToReplace:
            if 'Primary' in words:
                if 'Dim' in words:
                    IS = 'rgba(' + str(ListToReplace[words][0]) + ', ' + str(ListToReplace[words][1]) + ', ' + str(
                        ListToReplace[words][2]) + ', 0.2)'
                    PR = "$ColorPrimaryDimIn: " + IS + ";"
                    MainData = MainData.replace(words, PR)
                else:
                    IS = 'rgba(' + str(ListToReplace[words][0]) + ', ' + str(ListToReplace[words][1]) + ', ' + str(
                        ListToReplace[words][2]) + ', 1)'
                    PR = "$ColorPrimary: " + IS + ";"
                    MainData = MainData.replace(words, PR)
            if 'Secondary' in words:
                IS = 'rgba(' + str(ListToReplace[words][0]) + ', ' + str(ListToReplace[words][1]) + ', ' + str(
                    ListToReplace[words][2]) + ', 1)'
                SC = "$ColorSecondary: " + IS + ";"
                MainData = MainData.replace(words, SC)
            if 'Tertiary' in words:
                IS = 'rgba(' + str(ListToReplace[words][0]) + ', ' + str(ListToReplace[words][1]) + ', ' + str(
                    ListToReplace[words][2]) + ', 1)'
                TR = "$ColorTertiary: " + IS + ";"
                MainData = MainData.replace(words, TR)
            if 'Complementary' in words:
                IS = 'rgba(' + str(ListToReplace[words][0]) + ', ' + str(ListToReplace[words][1]) + ', ' + str(
                    ListToReplace[words][2]) + ', 1)'
                CR = "$ColorComplementary: " + IS + ";"
                MainData = MainData.replace(words, CR)
        file.close()

    with open("style.scss", "w") as file:
        file.write(MainData)
        file.close()


def main():
    First()
    with open("style.scss", "r") as scssfile:
        Data = scssfile.read()
        New = css.compile(Data)
        with open("style.css", "w") as cssfile:
            cssfile.write(New)
            cssfile.close()
        scssfile.close()


main()
