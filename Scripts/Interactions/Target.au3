;~ Description : Select and attack the nearest enemy of the player.
Func Target_AttackNearestEnemy()
    Local $nearestEnnemiAgentID
	TargetNearestEnemy()
	

	InitGUI_LogIntoGUIConsole("Targeting : " & $nearestEnnemiAgentID)
    Attack($nearestEnnemiAgentID)
    InitGUI_LogIntoGUIConsole("Attacking !")
EndFunc ;~ TargetNearestEnemy

Func Target_FightingPattern()
	Local $nearestEnnemiAgentID
	Local $distanceToTarget
	TargetNearestEnemy()
	
	Local $lDeadlock = TimerInit()
	Do
		$nearestEnnemiAgentID = GetCurrentTargetID()
		Sleep(100)
	Until $nearestEnnemiAgentID <> 0 Or TimerDiff($lDeadlock) > 5000

	$distanceToTarget = Target_GetDistanceToTarget()
	If $distanceToTarget > 1500 Then Return

	While $distanceToTarget < 1800 and $distanceToTarget > 0
		;~ TODO : Change ActionInteract and while by Real pattern of attack
		Attack($nearestEnnemiAgentID)
		While GetCurrentTargetID() <> ""
			Target_DoActionToFight()
		WEnd
		TargetNearestEnemy()
		Sleep(100)
		$nearestEnnemiAgentID = GetCurrentTargetID()
		$distanceToTarget = Target_GetDistanceToTarget()
	WEnd
	ClearTarget()

EndFunc ;~ Target_FightingPattern

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
		If Target_GetDistanceToTarget() > 2500 Then ContinueLoop
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

Func Target_DoActionToFight()
	Local $currentTargetAgent = GetCurrentTarget()
	Local $IdSkillToUse
	Local $targetToUse

	If GetHealth() < 400 And IsRecharged(4) Then 
		$IdSkillToUse = 4
		$targetToUse = -2
	ElseIf GetHealth() < 350 And IsRecharged(7) Then 
		$IdSkillToUse = 7
		$targetToUse = -2
	ElseIf IsRecharged(2) Then 
		$IdSkillToUse = 2
		$targetToUse = $currentTargetAgent
	ElseIf IsRecharged(3) Then 
		$IdSkillToUse = 3
		$targetToUse = $currentTargetAgent
	ElseIf IsRecharged(1) Then 
		$IdSkillToUse = 1
		$targetToUse = -2
	Else
		return
	EndIf
	
	UseSkillEx($IdSkillToUse, $targetToUse)
EndFunc ;~ Target_DoActionToFight