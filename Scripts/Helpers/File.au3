Global $filePath = ""

;~ Description : Log a function into the log file.
;~ Remarks, the "$paramsArray" must contains the full name of the params, including the "$" char.
Func File_LogFunction($funcName, $paramsArray = Null)
    Local $msgLog
    $msgLog = $funcName & '('
    If $paramsArray <> Null Then    
        For $i = 0 To Ubound($paramsArray) -1
            If $paramsArray[$i] <> "" Then
            $msgLog = $msgLog _
                        & $paramsArray[$i] _
                        & ", "
            EndIf
       Next
        $msgLog = StringReplace($msgLog, ", ", "", -1)
    EndIf
    $msgLog = $msgLog & ")"
    File_Write($msgLog)
EndFunc ;~ File_LogFunction

;~ Description : Log a variable definition or attribution.
;~ Remarks : 
;~      $addDefine = 0 ===> No particular definition
;~      $addDefine = 1 ===> Add "Local" to the definition
;~      $addDefine = 2 ===> Add "Global" to the definition
Func File_LogVariable($varName, $value = Null, $addDefine = 0)
    Local $msgLog = ""
    Switch ($addDefine)
        Case 1
            $msgLog = "Local "
        Case 2
            $msgLog = "Global"
    EndSwitch
    $msgLog = $msgLog & $varName

    if ($value <> null) then
        $msgLog = $msgLog & " = " _
                          & $value
    EndIf

    File_Write($msgLog)
EndFunc

;~ Description : Log a Opening while loop
;~ Remarks : To close the loop, use :    File_LogVariable("WEnd")
Func File_LogWhile($condition = Null)
    Local $msgLog
    $msgLog = "While "

    If ($condition <> null) Then
        $msgLog = $msgLog & $condition
    Else
        $msgLog = $msgLog & "1"
    EndIf

    File_Write($msgLog)
EndFunc ;~ File_LogWhile

;~ Description : Initialize the log file.
Func File_InitFile()
    Local $fileName
    $fileName = "Log_" & _NowDate() _
                       & "_" _
                       & _NowTime(5) _ 
                       & ".au3"

    $fileName = StringReplace($fileName, ":", "-")
    $fileName = StringReplace($fileName, "/", "-")

    $filePath = @ScriptDir & "\..\..\Logs\" & $fileName
    FileWrite($filePath, ";~ Log file" & @CRLF & '#include "../Start/Start.au3"' & @CRLF)
EndFunc ;~ File_InitFile()

;~ Description : Write the value in the LogFile.
Func File_Write($value)
    if ($filePath == "") then File_InitFile()
    FileWrite($filePath, $value & @CRLF)
EndFunc