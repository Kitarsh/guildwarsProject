;~ Log file
#include "../../../Start/Start.au3"
Local $processId = ProcessExists("gw.exe")
MemoryOpen($processId)
While 1
TravelTo(165)
MoveTo(316, 7965)
Move(633, 7270)
WaitMapLoading()
MoveTo(1296, 5312)
Fight_FightingPattern()
Target_PickUpLoot()
MoveTo(2328, 9378)
Fight_FightingPattern()
Target_PickUpLoot()
WEnd
MemoryClose()
$mGWProcHandle = 0
Exit
