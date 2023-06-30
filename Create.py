import sys

Argument = sys.argv[1]
Name = sys.argv[2]


def CreateNewPage(FileName):
    Data = '''<Container
    width="match-parent"
    height="match-parent">
    
    
    
</Container>'''

    with open("../App/Layout/" + FileName + ".xml", "w") as New:
        New.write(Data)
        New.close()


if Argument == "NewPage":
    CreateNewPage(Name)
