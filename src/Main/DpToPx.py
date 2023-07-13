import DpValueCalculator
import os

if not os.path.exists("../Temp"):
    os.makedirs("../Temp")


def FromDir(DirName):
    ListToReplace = {}
    with os.scandir(str(DirName)) as designPath:
        for files in designPath:
            if os.path.isfile(files):
                with open(str(DirName) + files.name, 'r') as file:
                    for line in file:
                        for word in line.split():
                            S = str(word)
                            if 'width' in S:
                                C = S.split('"')
                                V = C[1]
                                if 'dp' in V:
                                    NV = str(V)
                                    value = NV[0:-2]
                                    NewValueWidth = DpValueCalculator.Dp(int(value))
                                    ListToReplace[S] = NewValueWidth
                            if 'height' in S:
                                C = S.split('"')
                                V = C[1]
                                if 'dp' in V:
                                    NV = str(V)
                                    value = NV[0:-2]
                                    NewValueHeight = DpValueCalculator.Dp(int(value))
                                    ListToReplace[S] = NewValueHeight

                            if 'border-radius' in S:
                                C = S.split('"')
                                V = C[1]
                                if 'dp' in V:
                                    NV = str(V)
                                    value = NV[0:-2]
                                    NewValueBorderRadius = DpValueCalculator.Dp(int(value))
                                    ListToReplace[S] = NewValueBorderRadius

                            if 'padding' in S:
                                C = S.split('"')
                                V = C[1]
                                if 'dp' in V:
                                    NV = str(V)
                                    value = NV[0:-2]
                                    NewValuePadding = DpValueCalculator.Dp(int(value))
                                    ListToReplace[S] = NewValuePadding

                            if 'margin' in S:
                                C = S.split('"')
                                V = C[1]
                                if 'dp' in V:
                                    NV = str(V)
                                    value = NV[0:-2]
                                    NewValueMargin = DpValueCalculator.Dp(int(value))
                                    ListToReplace[S] = NewValueMargin

                            if 'gap' in S:
                                C = S.split('"')
                                V = C[1]
                                if 'dp' in V:
                                    NV = str(V)
                                    value = NV[0:-2]
                                    NewValueGap = DpValueCalculator.Dp(int(value))
                                    ListToReplace[S] = NewValueGap

                with open(str(DirName) + files.name, 'r') as copy:
                    Data = copy.read()
                    for words in ListToReplace:
                        if 'height' in words:
                            Data = Data.replace(words, 'height="' + ListToReplace[words] + '"')
                        if 'width' in words:
                            Data = Data.replace(words, 'width="' + ListToReplace[words] + '"')
                        if 'border-radius' in words:
                            Data = Data.replace(words, 'border-radius="' + ListToReplace[words] + '"')
                        if 'padding' in words:
                            Data = Data.replace(words, 'padding="' + ListToReplace[words] + '"')
                        if 'margin' in words:
                            Data = Data.replace(words, 'margin="' + ListToReplace[words] + '"')
                        if 'gap' in words:
                            Data = Data.replace(words, 'gap="' + ListToReplace[words] + '"')
                    copy.close()

                if "Include" in DirName:
                    if not os.path.exists("../Temp/Include"):
                        os.makedirs("../Temp/Include")
                    with open("../Temp/Include/" + files.name, 'w') as w:
                        w.write(Data)
                        w.close()

                else:
                    with open("../Temp/" + files.name, 'w') as w:
                        w.write(Data)
                        w.close()


def main():
    FromDir("../App/Layout/")
    FromDir("../App/Layout/Include/")
