;~ Log file
#include "../../../Start/Start.au3"
Local $processId = ProcessExists("gw.exe")
MemoryOpen($processId)
TravelTo(166)
MoveTo(22870, 10271)
MoveTo(22556, 7633)
Move(22579, 6731)
WaitMapLoading()
MoveTo(19656, 3057)
MoveTo(17154, 2565)
Target_FightingPattern()
Target_PickUpLoot()
MoveTo(16957, 7287)
Target_FightingPattern()
Target_PickUpLoot()
MoveTo(14526, 11313)
MoveTo(15186, 16508)
GoToNPC(12) ;~ Nicholas Sandford
Dialog("0x85")
Dialog("0x86")
MemoryClose()
$mGWProcHandle = 0
Exit
