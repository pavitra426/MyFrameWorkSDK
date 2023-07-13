import DpChangeDetector

DPIndex = DpChangeDetector.getChange()


def Dp(Dpv):
    V = round(Dpv * (DPIndex[0] / DPIndex[1]))
    return str(V) + "px"
