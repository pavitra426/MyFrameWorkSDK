from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent.parent.parent


class AlertDialog:

    def __init__(self):
        self.S = "var AlertDialogContainer = document.createElement('div');" \
                 "AlertDialogContainer.classList.add('Alert-Dialog-Container');" \
                 "var AlertDialog = document.createElement('div');" \
                 "AlertDialog.classList.add('Alert-Dialog');" \
                 "AlertDialogContainer.appendChild(AlertDialog);"

    def setTitle(self, Title):
        self.S += "var AlertHead = document.createElement('div');" \
                  "AlertHead.classList.add('Alert-Head');" \
                  "AlertHead.innerHTML = '" + Title + "';AlertDialog.appendChild(AlertHead);"

    def setText(self, Text):
        self.S += "var AlertDescription = document.createElement('div');" \
                  "AlertDescription.classList.add('Alert-Description');" \
                  "AlertDescription.innerHTML = '" + Text + "';" \
                  "AlertDialog.appendChild(AlertDescription);" \
                                                            "var AlertNavArea = document.createElement('div');" \
                  "AlertNavArea.classList.add('Alert-Nav-Area');" \
                  "AlertDialog.appendChild(AlertNavArea);" \
                  "var AlertButtonArea = document.createElement('div');" \
                  "AlertButtonArea.classList.add('Alert-Button-Area');" \
                  "AlertNavArea.appendChild(AlertButtonArea);"

    def setButton(self, ButtonText):
        self.S += "var AlertClickableText = document.createElement('div');" \
                  "AlertClickableText.classList.add('Alert-clickable-text');" \
                  "AlertClickableText.innerHTML = '" + ButtonText + "';AlertButtonArea.appendChild(AlertClickableText);"

    def show(self, Commit):
        self.S += "document.getElementsByTagName('body')[0].appendChild(AlertDialogContainer);"

        def Return():
            return self.S

        def Write():
            P = str(BASE_DIR) + "\Main\Event.js"
            with open(P, "a") as EventFile:
                EventFile.write(self.S)
                EventFile.close()

        if not Commit:
            return Return()
        else:
            return Write()
