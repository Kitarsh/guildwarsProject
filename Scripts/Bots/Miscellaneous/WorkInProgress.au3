#include "../../Start/Start.au3"

Local $processId = ProcessExists("gw.exe")
MemoryOpen($processId)
GUI_Init()
MemoryClose()
$mGWProcHandle = 0