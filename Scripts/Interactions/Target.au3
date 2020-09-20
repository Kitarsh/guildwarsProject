;~ Description : Select and attack the nearest enemy of the player.
Func Target_AttackNearestEnemy()
    Local $nearestEnnemiAgentID
	TargetNearestEnemy()
	

	InitGUI_LogIntoGUIConsole("Targeting : " & $nearestEnnemiAgentID)
    Attack($nearestEnnemiAgentID)
    InitGUI_LogIntoGUIConsole("Attacking !")
EndFunc ;~ TargetNearestEnemy

Func Target_GetDistanceToTarget()
	Local $nearestEnnemiAgentID = GetCurrentTargetID()
	If $nearestEnnemiAgentID == "" Then 
		InitGUI_LogIntoGUIConsole("No target in range !")
		return -1
	EndIf

	Local $currentPlayerPosition = _Move_GetPlayerPosition()
	Local $currentTargetX = DllStructGetData(GetAgentByID($nearestEnnemiAgentID), 'X')
	Local $currentTargetY = DllStructGetData(GetAgentByID($nearestEnnemiAgentID), 'Y')

	return ComputeDistance( _
			Round($currentPlayerPosition[0]), _
			Round($currentPlayerPosition[1]), _
			Round($currentTargetX), _
			Round($currentTargetY))
EndFunc ;~ Target_GetDistanceToTarget

Func Target_UseSkillOnTarget($skillNumber)
	Local $target
	$target = GetCurrentTarget()
	If $target == null Or $target == 0 Then 
		TargetNearestEnemy()
		Sleep(100)
		$target = GetCurrentTarget()
	EndIf

	UseSkill($skillNumber, $target)
EndFunc ;~ Target_UseSkillOnTarget

Func Target_PickUpNearestLoot()
	TargetNearestItem()
    ActionInteract()
EndFunc ;~ Target_PickUpNearestLoot

Func Target_PickUpLoot()
	Local $lAgent
	Local $aitem
	Local $lDeadlock
	For $i = 1 To GetMaxAgents()
		If GetIsDead(-2) Then Return
		$lAgent = GetAgentByID($i)
		If DllStructGetData($lAgent, 'Type') <> 0x400 Then ContinueLoop
		$aitem = GetItemByAgentID($i)
		
		;~ Adding a distance limit to pickup the item
		ChangeTarget($i)
		Sleep(200)
		If Target_GetDistanceToTarget() > 3500 Then ContinueLoop
		If Not(GetCanPickUp($aitem)) Then ContinueLoop
		If Items_CanPickUp($aitem) Then
            PickUpItem($aitem) 
			$lDeadlock = TimerInit()
			While GetAgentExists($i)
				Sleep(100)
				If GetIsDead(-2) Then Return
				If TimerDiff($lDeadlock) > 10000 Then ExitLoop
			WEnd
		EndIf
	Next
EndFunc   ;==>PickUpLoot
