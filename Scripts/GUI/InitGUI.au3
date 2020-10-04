
Global $idEdit_Console
Global $idWaypoints_ListView
Global $idsWaypoints_ListViewItems[32]
Global $idMaps_ListView
Global $idsMaps_ListViewItems[5]


Func GUI_Init()
    GUICreate("Guild Wars Project", 700, 600, -1, -1)


	;~ Create an edit box with no text in it
    $idEdit_Console = GUICtrlCreateEdit("", 10, 10, 200, 280)
    
	;~ Create an listview for Waypoints
    $idWaypoints_ListView = GUICtrlCreateListView("Waypoints| |", 490, 10, 200, 140)

	;~ Create an listview for Maps
    $idMaps_ListView = GUICtrlCreateListView("Maps|", 490, 160, 200, 140)

    ;~ Create the test button
    $idTest_Btn = GUICtrlCreateButton("Test", 230, 180, 50, 50)

    ;~ Create the up button
    $idForward_Btn = GUICtrlCreateButton("↑", 290, 180, 50, 50)

    ;~ Create the left button
    $idLeft_Btn = GUICtrlCreateButton("←", 230, 240, 50, 50)

    ;~ Create the position button
    $idPosition_Btn = GUICtrlCreateButton("☩", 290, 240, 50, 50)

    ;~ Create the right button
    $idRight_Btn = GUICtrlCreateButton("→", 350, 240, 50, 50)
    
    ;~ Create the attackNearest button
    $idAttackNearest_Btn = GUICtrlCreateButton("Attack Pattern", 230, 120, 170, 50)
    
    ;~ Create the pick up loop button
    $idPickUpLoot_Btn = GUICtrlCreateButton("Pick Up Loot", 230, 60, 170, 50)

    SkillsGUI_InitSkillsBtn()

    ;~ Generate tabs
    $idfirstTab_Tab = GUICtrlCreateTab(0, 370, 500, 100)
    GUICtrlCreateTabItem("Merchants")

    ;~ Create the sell rare material button
    $idSellRareMat_Btn = GUICtrlCreateButton("Sell Rare Mat", 10, 410, 110)

    ;~ Create the sell common material button
    $idSellCommonMat_Btn = GUICtrlCreateButton("Sell Common Mat", 130, 410, 110)

    ;~ Create the sell weapons button
    $idSellWeapons_Btn = GUICtrlCreateButton("Sell Weapons", 250, 410, 110)

    ;~ Create the sell weapons button
    $idStoreGold_Btn = GUICtrlCreateButton("Store Gold", 370, 410, 110)
    GUICtrlCreateTabItem("Move")
    GUICtrlCreateLabel("Sample Tab with TabItems", 250, 40)
    GUICtrlCreateTabItem("")

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
                ExitLoop
            
            Case $iMsg = $idLeft_Btn
                Move_TurnLeft()
            
            Case $iMsg = $idRight_Btn
                Move_TurnRight()
            
            Case $iMsg = $idForward_Btn
                Move_GoForward()
            
            Case $iMsg = $idPosition_Btn
                InitGUI_LogPosition()
                InitGUI_LogIdMap()

            Case $iMsg = $idAttackNearest_Btn
                Fight_FightingPattern()
                ;~ Logging Fight
                File_LogFunction("Fight_FightingPattern")

            Case $iMsg = $idPickUpLoot_Btn
                Target_PickUpLoot()
                ;~ Logging Fight
                File_LogFunction("Target_PickUpLoot")
            
            Case $iMsg = $idTest_Btn
                Local $lAllegiance = Target_GetAllegiance()
                Local $lDaggerStatus = Target_GetDaggerStatus()
                Local $lWeaponType = Target_GetWeaponType()
                Local $lSkill = Target_GetSkill()
                InitGUI_LogIntoGUIConsole("Allegiance : " & $lAllegiance _
                                & @CRLF & "WeaponType : " & $lWeaponType _
                                & @CRLF & "DaggerStatus : " & $lDaggerStatus _
                                & @CRLF & "Skill : " & $lSkill _
                                )
                
            Case $iMsg = $idSellRareMat_Btn
                Sell_RareMatInInventory()
            
            Case $iMsg = $idSellCommonMat_Btn
                Sell_CommonMatInInventory()
            
            Case $iMsg = $idSellWeapons_Btn
                Sell_WeaponsInInventory()

            Case $iMsg = $idStoreGold_Btn
                Gold_Store()
                
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
            
            Case $iMsg > 0 And Array_Contains($iMsg, $idsWaypoints_ListViewItems)
                $indexItem = Array_IndexOf($iMsg, $idsWaypoints_ListViewItems)
                $xPosWaypoint = _GUICtrlListView_GetItem($idWaypoints_ListView, $indexItem - 1, 0)[3]
                $yPosWaypoint = _GUICtrlListView_GetItem($idWaypoints_ListView, $indexItem - 1, 1)[3]

                ;~ Logging Movement
                Local $paramsLog[2]
                $paramsLog[0] = $xPosWaypoint
                $paramsLog[1] = $yPosWaypoint
                File_LogFunction("MoveTo", $paramsLog)

                MoveTo($xPosWaypoint, $yPosWaypoint)

            Case $iMsg > 0 And Array_Contains($iMsg, $idsMaps_ListViewItems)
                $indexItem = Array_IndexOf($iMsg, $idsMaps_ListViewItems)
                $idMap = _GUICtrlListView_GetItem($idMaps_ListView, $indexItem - 1, 0)[3]

                ;~ Logging Teleport
                Local $paramsLog[1]
                $paramsLog[0] = $idMap
                File_LogFunction("TravelTo", $paramsLog)

                TravelTo($idMap)

		EndSelect
    WEnd
EndFunc ; Init
 

; Description : Log the value in the GUI Console.
Func InitGUI_LogIntoGUIConsole($value = '')
    $editValue = ''
    ;~ $editValue = GUICtrlRead($idEdit_Console)
    $nowTime = _NowTime(5)
    If $editValue == '' Then
        $newEditValue = '[' & $nowTime & '] ' & $value
    Else
        $newEditValue = @CRLF & '[' & $nowTime & '] ' & $value
    EndIf
    GUICtrlSetData($idEdit_Console, $newEditValue)
EndFunc ;~ InitGUI_LogIntoGUIConsole

; Description : Log the position of the player in the GUI console.
Func InitGUI_LogPosition()
    Local $currentPosition = _Move_GetPlayerPosition()
    InitGUI_LogIntoGUIConsole("Current Position :")
    InitGUI_LogIntoGUIConsole("X : " & $currentPosition[0])
    InitGUI_LogIntoGUIConsole("Y : " & $currentPosition[1])

    Local $newWaypoints = GUICtrlCreateListViewItem( Round($currentPosition[0]) _
                                                   & "|" _ 
                                                   & Round($currentPosition[1]) _
                                                   , $idWaypoints_ListView)

    Local $count = _GUICtrlListView_GetItemCount($idWaypoints_ListView)
    $idsWaypoints_ListViewItems[$count] = $newWaypoints
EndFunc ;~ InitGUI_LogPosition

; Description : Log the current map's ID.
Func InitGUI_LogIdMap()
    Local $currentMapID = GetMapID()

    InitGUI_LogIntoGUIConsole("Current IdMap : " & $currentMapID)
    Local $count = _GUICtrlListView_GetItemCount($idMaps_ListView)

    Local $allIdMapsRecorded[$count]
    For $i = 0 To $count - 1
        $allIdMapsRecorded[$i] = _GUICtrlListView_GetItem($idMaps_ListView, $i)[3]
    Next
    Local $test = _ArrayFindAll($allIdMapsRecorded, $currentMapID) <> -1

    If $test Then Return

    Local $newMap = GUICtrlCreateListViewItem($currentMapID, $idMaps_ListView)
    $count = _GUICtrlListView_GetItemCount($idMaps_ListView)
    $idsMaps_ListViewItems[$count] = $newMap
EndFunc ;~ InitGUI_LogIdMap