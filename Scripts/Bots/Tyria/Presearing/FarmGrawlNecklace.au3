;~ Log file
#include "../../../Start/Start.au3"
Local $processId = ProcessExists("gw.exe")
MemoryOpen($processId)
While 1
TravelTo(163)
MoveTo(-7080, 1437)
Move(-7459, 1458)
WaitMapLoading()
MoveTo(-2375, 240)
Target_FightingPattern()
Target_PickUpLoot()
MoveTo(2839, 6807)
Target_FightingPattern()
Target_PickUpLoot()
MoveTo(6187, 7402)
Target_FightingPattern()
Target_PickUpLoot()
MoveTo(7200, 9925)
Target_FightingPattern()
Target_PickUpLoot()
MoveTo(5164, 13950)
Target_FightingPattern()
Target_PickUpLoot()
MoveTo(9613, 12347)
Target_FightingPattern()
Target_PickUpLoot()
MoveTo(9599, 10033)
Target_FightingPattern()
Target_PickUpLoot()
MoveTo(10277, 14034)
Target_FightingPattern()
Target_PickUpLoot()
MoveTo(15734, 12006)
Target_FightingPattern()
Target_PickUpLoot()
WEnd
MemoryClose()
$mGWProcHandle = 0
Exit