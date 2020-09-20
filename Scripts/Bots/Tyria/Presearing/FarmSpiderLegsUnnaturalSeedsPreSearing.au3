;~ Log file
#include "../../../Start/Start.au3"
Local $processId = ProcessExists("gw.exe")
MemoryOpen($processId)
While 1
    TravelTo(166)
    MoveTo(22934, 10802)
    MoveTo(22538, 7531)
    Move(22614, 6849)
    WaitMapLoading()
    MoveTo(21917, 3845)
    MoveTo(19133, 446)
    MoveTo(18206, -2882)
    MoveTo(18409, -2571)
    Fight_FightingPattern()
    Target_PickUpLoot()
    MoveTo(16076, -4719)
    Fight_FightingPattern()
    Target_PickUpLoot()
    MoveTo(16962, -10358)
    Fight_FightingPattern()
    Target_PickUpLoot()
    MoveTo(20287, -12275)
    Fight_FightingPattern()
    Target_PickUpLoot()
WEnd
MemoryClose()
$mGWProcHandle = 0
Exit
