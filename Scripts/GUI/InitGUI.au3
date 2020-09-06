
Global $idEdit_Console
Global $idLeft_Btn
Global $idRight_Btn
Global $idForward_Btn
Global $idPosition_Btn

Func GUI_Init()
    GUICreate("Guild Wars Project", 500, 500, -1, -1)

	;~ Create an edit box with no text in it
	$idEdit_Console = GUICtrlCreateEdit("", 10, 10, 200, 280)

    ;~ Create the up button
    $idForward_Btn = GUICtrlCreateButton("↑", 290, 180, 50, 50)

    ;~ Create the left button
    $idLeft_Btn = GUICtrlCreateButton("←", 230, 240, 50, 50)

    ;~ Create the position button
    $idPosition_Btn = GUICtrlCreateButton("☩", 290, 240, 50, 50)

    ;~ Create the right button
    $idRight_Btn = GUICtrlCreateButton("→", 350, 240, 50, 50)
    
    ;Show window/Make the window visible
    GUISetState(@SW_SHOW)
    
	;Loop until:
	;- user presses Esc
	;- user presses Alt+F4
	;- user clicks the close button
    While 1
		;After every loop check if the user clicked something in the GUI window
		$iMsg = GUIGetMsg()
		Select

			;Check if user clicked on the close button
			Case $iMsg = -3 ;~ $GUI_EVENT_CLOSE
				;Destroy the GUI including the controls
				GUIDelete()
				;Exit the script
                Exit
            
            Case $iMsg = $idLeft_Btn
                Move_TurnLeft()
            
            Case $iMsg = $idRight_Btn
                Move_TurnRight()
            
            Case $iMsg = $idForward_Btn
                Move_GoForward()
            
            Case $iMsg = $idPosition_Btn
                InitGUI_LogPosition()
		EndSelect
    WEnd
EndFunc ; Init


; Description : Log the value in the GUI Console.
Func InitGUI_LogIntoGUIConsole($value = '')
    $editValue = GUICtrlRead($idEdit_Console)
    $nowTime = _NowTime(4)
    If $editValue == '' Then
        $newEditValue = '[' & $nowTime & '] ' & $value
    Else
        $newEditValue = @CRLF & '[' & $nowTime & '] ' & $value
    EndIf
    GUICtrlSetData($idEdit_Console, $newEditValue, 1)
EndFunc ;~ InitGUI_LogIntoGUIConsole

; Description : Log the position of the player in the GUI console.
Func InitGUI_LogPosition()
    $currentPosition = _Move_GetPlayerPosition()
    InitGUI_LogIntoGUIConsole("Current Position :")
    InitGUI_LogIntoGUIConsole("X : " & $currentPosition[0])
    InitGUI_LogIntoGUIConsole("Y : " & $currentPosition[1])
EndFunc ;~ InitGUI_LogPosition