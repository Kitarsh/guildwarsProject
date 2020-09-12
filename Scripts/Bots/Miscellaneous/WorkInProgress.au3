#include "../../Start/Start.au3"


File_LogVariable("$processId", 'ProcessExists("gw.exe")', 1)
Local $processId = ProcessExists("gw.exe")

Local $params[1]
$params[0] = "$processId"
File_LogFunction("MemoryOpen", $params)
MemoryOpen($processId)


File_LogWhile()
GUI_Init()
File_LogVariable("WEnd")

File_LogFunction("MemoryClose")
MemoryClose()

File_LogVariable("$mGWProcHandle", "0")
$mGWProcHandle = 0

File_LogVariable("Exit")
Exit