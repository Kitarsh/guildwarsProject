;~ Log file
#include "../Start/Start.au3"
Local $processId = ProcessExists("gw.exe")
MemoryOpen($processId)
While 1
RndTravel(164)
MoveTo(-11775, -6270)
Move(-11001, -6233)
WaitMapLoading(146)
MoveTo(-7909, -6278)
MoveTo(-6385, -2042)
Target_FightingPattern()
Target_PickUpLoot()
RndTravel(164)
WEnd
MemoryClose()
$mGWProcHandle = 0
Exit
