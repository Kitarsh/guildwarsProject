
Global $idEdit_Console
Global $idWaypoints_ListView
Global $idsWaypoints_ListViewItems[32]

Func GUI_Init()
    GUICreate("Guild Wars Project", 700, 400, -1, -1)

	;~ Create an edit box with no text in it
    $idEdit_Console = GUICtrlCreateEdit("", 10, 10, 200, 280)
    
	;~ Create an listview with no text in it for Waypoints
    $idWaypoints_ListView = GUICtrlCreateListView("Waypoints| |", 490, 10, 200, 280)

    ;~ Create the up button
    $idForward_Btn = GUICtrlCreateButton("↑", 290, 180, 50, 50)

    ;~ Create the left button
    $idLeft_Btn = GUICtrlCreateButton("←", 230, 240, 50, 50)

    ;~ Create the position button
    $idPosition_Btn = GUICtrlCreateButton("☩", 290, 240, 50, 50)

    ;~ Create the right button
    $idRight_Btn = GUICtrlCreateButton("→", 350, 240, 50, 50)
    
    ;~ Create the attackNearest button
    $idAttackNearest_Btn = GUICtrlCreateButton("Attack Nearest", 230, 120, 170, 50)
    
    ;~ Create the pick up loop button
    $idPickUpLoot_Btn = GUICtrlCreateButton("Pick Up Loot", 230, 60, 170, 50)

    SkillsGUI_InitSkillsBtn()

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

            Case $iMsg = $idAttackNearest_Btn
                Target_AttackNearestEnemy()

            Case $iMsg = $idPickUpLoot_Btn
                Target_PickUpNearestLoot()
            
            Case $iMsg = $idSkill1_Btn
                Target_UseSkillOnTarget(1)
            
            Case $iMsg = $idSkill2_Btn
                Target_UseSkillOnTarget(2)
            
            Case $iMsg = $idSkill3_Btn
                Target_UseSkillOnTarget(3)
            
            Case $iMsg = $idSkill4_Btn
                Target_UseSkillOnTarget(4)
            
            Case $iMsg = $idSkill5_Btn
                Target_UseSkillOnTarget(5)
            
            Case $iMsg = $idSkill6_Btn
                Target_UseSkillOnTarget(6)
            
            Case $iMsg = $idSkill7_Btn
                Target_UseSkillOnTarget(7)
            
            Case $iMsg = $idSkill8_Btn
                Target_UseSkillOnTarget(8)

            Case $iMsg = $idWaypoints_ListView
                ;### Debug MSGBOX ↓↓↓
                MsgBox(262144, 'Debug line ~' & @ScriptLineNumber, 'Selection:' & @CRLF & '$idWaypoints_ListView' & @CRLF & @CRLF & 'Return:' & @CRLF & $idWaypoints_ListView)
            
            Case $iMsg > 0 And ExistInArray($iMsg, $idsWaypoints_ListViewItems)
                $indexItem = IndexOf($iMsg, $idsWaypoints_ListViewItems)
                $xPosWaypoint = _GUICtrlListView_GetItem($idWaypoints_ListView, $indexItem - 1, 0)[3]
                $yPosWaypoint = _GUICtrlListView_GetItem($idWaypoints_ListView, $indexItem - 1, 1)[3]
                MoveTo($xPosWaypoint, $yPosWaypoint)
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
    $newWaypoints = GUICtrlCreateListViewItem(Round($currentPosition[0]) & "|" & Round($currentPosition[1]), $idWaypoints_ListView)
    $count = _GUICtrlListView_GetItemCount($idWaypoints_ListView)
    $idsWaypoints_ListViewItems[$count] = $newWaypoints
EndFunc ;~ InitGUI_LogPosition
