;~ Log file
#include "../Start/Start.au3"
Local $processId = ProcessExists("gw.exe")
MemoryOpen($processId)
While 1
MoveTo(8293, 6394)
MoveTo(8222, 5874)
MoveTo(7724, 5708)
MoveTo(7564, 6160)
WEnd
MemoryClose()
$mGWProcHandle = 0
Exit
