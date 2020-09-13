#include "../../../Start/Start.au3"
Local $processId = ProcessExists("gw.exe")
MemoryOpen($processId)
While 1
    TravelTo(166)
    MoveTo(23375, 10922)
    MoveTo(22600, 8012)
    Move(22614, 6849)
    WaitMapLoading()
    MoveTo(20799, 3127)
    MoveTo(15778, 3195)
    MoveTo(16561, 4581)
    Target_FightingPattern()
    Target_PickUpLoot()
WEnd
MemoryClose()
$mGWProcHandle = 0
Exit
