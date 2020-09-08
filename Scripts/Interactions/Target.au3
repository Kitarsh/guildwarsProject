;~ Description : Select and attack the nearest enemy of the player.
Func Target_AttackNearestEnemy()
    Local $nearestEnnemiAgentID
    TargetNearestEnemy()
    $nearestEnnemiAgentID = GetCurrentTargetID()
    InitGUI_LogIntoGUIConsole("Targeting : " & $nearestEnnemiAgentID)
    ActionInteract()
    InitGUI_LogIntoGUIConsole("Attacking !")
EndFunc ;~ TargetNearestEnemy

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
		If GetCanPickUp($aitem) Then
            ActionInteract()
            ;~ PickUpItem($aitem) => Supposed to work, but only crash the game. Interaction with agents doesn't work. Idk why.
			$lDeadlock = TimerInit()
			While GetAgentExists($i)
				Sleep(100)
				If GetIsDead(-2) Then Return
				If TimerDiff($lDeadlock) > 10000 Then ExitLoop
			WEnd
		EndIf
	Next
EndFunc   ;==>PickUpLoot
