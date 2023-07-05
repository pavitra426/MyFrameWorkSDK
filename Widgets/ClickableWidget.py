from pathlib import Path
import os

BASE_DIR = Path(__file__).resolve().parent.parent.parent.parent


class Clickable:
    P = str(BASE_DIR) + "\Main\Event.js"
    if os.path.exists(P):
        os.remove(P)

    def __init__(self):
        self.ID = ""

    def ConnectViaID(self, ForID):
        self.ID = ForID

    def OnClick(self, func):
        Start = "document.getElementById('" + self.ID + "').addEventListener('click', function () {"
        End = "});"
        for lines in func():
            Start += lines

        Start += End

        P = str(BASE_DIR) + "\Main\Event.js"
        with open(P, "a") as EventFile:
            EventFile.write(Start)
            EventFile.close()

    def SetBackground(self, BackgroundColor, Commit):
        def Return():
            return "document.getElementById('" + self.ID + "').style.background = '" + BackgroundColor + "';"

        def Write():
            S = "document.getElementById('" + self.ID + "').style.background = '" + BackgroundColor + "';"
            P = str(BASE_DIR) + "\Main\Event.js"
            with open(P, "a") as EventFile:
                EventFile.write(S)
                EventFile.close()

        if not Commit:
            return Return()
        else:
            return Write()

    def SetText(self, Text, Commit):
        def Return():
            return "document.getElementById('" + self.ID + "').childNodes[0].innerHTML = '" + Text + "';"

        def Write():
            S = "document.getElementById('" + self.ID + "').childNodes[0].innerHTML = '" + Text + "';"
            P = str(BASE_DIR) + "\Main\Event.js"
            with open(P, "a") as EventFile:
                EventFile.write(S)
                EventFile.close()

        if not Commit:
            return Return()
        else:
            return Write()
