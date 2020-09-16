;~ Log file
#include "../../../Start/Start.au3"
Local $processId = ProcessExists("gw.exe")
MemoryOpen($processId)
TravelTo(163)
MoveTo(-7048, 1445)
Move(-7887, 1438)
WaitMapLoading()
MoveTo(-5618, 4889)
MoveTo(-3562, 9040)
While 1
    Move(-2562, 9200)
    WaitMapLoading()
    MoveTo(-6744, 15777)
    Target_FightingPattern()
    Target_PickUpLoot()
    MoveTo(-3691, 18531)
    Target_FightingPattern()
    Target_PickUpLoot()
    MoveTo(-6744, 15777)
    MoveTo(-10510, 15845)
    Move(-10900, 16000)
    WaitMapLoading()
    MoveTo(-3562, 9040)
WEnd
MemoryClose()
$mGWProcHandle = 0
Exit
