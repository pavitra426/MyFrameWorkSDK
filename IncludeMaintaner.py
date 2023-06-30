import os

import convert

convert.Convert()


def CheckForInclude(DIR):
    ListToReplace = {}
    with open(DIR, "r") as file:
        for line in file:
            for word in line.split():
                S = str(word)
                if 'include' in S:
                    F = S.split("<")
                    NF = F[0]
                    NNF = NF.split("-")
                    FileName = NNF[1]
                    with open("../Out/Include/" + FileName + ".html", "r") as incFile:
                        IncData = incFile.read()
                        ListToReplace[NF] = IncData
                        incFile.close()
        file.close()

    with open(DIR, "r") as file:
        MainData = file.read()
        for words in ListToReplace:
            MainData = MainData.replace(words, ListToReplace[words])
        file.close()

    with open(DIR, "w") as file:
        file.write(MainData)
        file.close()

    Checking()


def Checking():
    with os.scandir("../Out/") as OutDir:
        for files in OutDir:
            if os.path.isfile(files):
                with open("../Out/" + files.name, "r") as MainFile:
                    D = MainFile.read()
                    if 'include' in D:
                        CheckForInclude("../Out/" + files.name)


def main():
    Checking()
    with os.scandir("../Out/Include/") as OutIncludePath:
        for files2 in OutIncludePath:
            if os.path.isfile(files2):
                os.remove("../Out/Include/" + files2.name)
    os.rmdir("../Out/Include")
