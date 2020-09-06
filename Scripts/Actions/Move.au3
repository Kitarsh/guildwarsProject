Func RunInSquare($sizeOfSquare = 200)
    $processId = ProcessExists("gw.exe")
    MemoryOpen($processId)
    Local $lAgentTest = GetAgentByID()
    $i = 0
    While $i < 2
        Local $MyPosXTest = DllStructGetData($lAgentTest, 'X')
        Local $MyPosYTest = DllStructGetData($lAgentTest, 'Y')
        MoveTo($MyPosXTest + $sizeOfSquare, $MyPosYTest, 1)

        Local $MyPosXTest = DllStructGetData($lAgentTest, 'X')
        Local $MyPosYTest = DllStructGetData($lAgentTest, 'Y')
        MoveTo($MyPosXTest, $MyPosYTest + $sizeOfSquare, 1)

        Local $MyPosXTest = DllStructGetData($lAgentTest, 'X')
        Local $MyPosYTest = DllStructGetData($lAgentTest, 'Y')
        MoveTo($MyPosXTest - $sizeOfSquare, $MyPosYTest, 1)

        Local $MyPosXTest = DllStructGetData($lAgentTest, 'X')
        Local $MyPosYTest = DllStructGetData($lAgentTest, 'Y')
        MoveTo($MyPosXTest, $MyPosYTest - $sizeOfSquare, 1)
        $i += 1
    WEnd
    MemoryClose()
    $mGWProcHandle = 0
EndFunc ;~ Run In Square