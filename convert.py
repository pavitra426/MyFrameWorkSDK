import lxml.etree as ET
import DpToPx
import os


def Convert():
    DpToPx.main()
    if not os.path.exists("../Out"):
        os.makedirs("../Out")

    if not os.path.exists("../Out/Include"):
        os.makedirs("../Out/Include")

    with os.scandir("../Temp") as temppath:
        for file in temppath:
            if os.path.isfile(file):
                dom = ET.parse("../Temp/" + file.name)
                xslt = ET.parse("./test.xsl")
                transform = ET.XSLT(xslt)
                newDom = transform(dom)
                FN = str(file.name)
                NFN = FN[0:-4]
                outfile = open("../Out/" + NFN + ".html", 'w')
                outfile.write(str(newDom))
                os.remove("../Temp/" + file.name)

    with os.scandir("../Temp/Include/") as temppath:
        for file in temppath:
            if os.path.isfile(file):
                dom = ET.parse("../Temp/Include/" + file.name)
                xslt = ET.parse("./test.xsl")
                transform = ET.XSLT(xslt)
                newDom = transform(dom)
                FN = str(file.name)
                NFN = FN[0:-4]
                outfile = open("../Out/Include/" + NFN + ".html", 'w')
                outfile.write(str(newDom))
                os.remove("../Temp/Include/" + file.name)

    os.rmdir("../Temp/Include")
    os.rmdir("../Temp")
