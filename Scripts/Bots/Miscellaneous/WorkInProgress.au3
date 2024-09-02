#include "../../Start/Start.au3"


File_LogVariable("$processId", 'ProcessExists("gw.exe")', 1)
Local $processId = ProcessExists("gw.exe")

Local $params[1]
$params[0] = "$processId"
File_LogFunction("MemoryOpen", $params)
MemoryOpen($processId)


File_LogWhile()
BaseGUI_Init("WIP", "Loop", "InnerLoop")
While $BaseGUI_KillMainLoop = False
    Sleep(1000)
    $BaseGUI_CounterOne_Value = $BaseGUI_CounterOne_Value + 1
    $i = 0
    While $i < 10
        $BaseGUI_CounterTwo_Value = $BaseGUI_CounterTwo_Value + 1
        $i = $i+1
        Sleep(10)
        BaseGUI_Update()
    WEnd
    BaseGUI_ConsoleLog("One Full Loop")
WEnd
File_LogVariable("WEnd")

File_LogFunction("MemoryClose")
MemoryClose()

File_LogVariable("$mGWProcHandle", "0")
$mGWProcHandle = 0

File_LogVariable("Exit")
Exit