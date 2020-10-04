; Description : Execute the global fighting pattern.
Func Fight_FightingPattern($aFirstTargetId = 0)
	Local $nearestEnnemiAgentID
	Local $distanceToTarget
	If $aFirstTargetId == 0 Then
		TargetNearestEnemy()
		Local $lDeadlock = TimerInit()
		Do
			$nearestEnnemiAgentID = GetCurrentTargetID()
			Sleep(100)
		Until $nearestEnnemiAgentID <> 0 Or TimerDiff($lDeadlock) > 5000
	Else 
		$nearestEnnemiAgentID = $aFirstTargetId
		ChangeTarget($nearestEnnemiAgentID)
		Sleep(100)
	EndIf

	$distanceToTarget = Target_GetDistanceToTarget()
	If $distanceToTarget > 1500 Then Return

	While $distanceToTarget < 1800 and $distanceToTarget > 0
		Attack($nearestEnnemiAgentID)
        Local $lDeadlock = TimerInit()
        Local $maxTime = 120000
        Do 
            Fight_DoActionToFight()
        Until Not(GetCurrentTargetID()) Or TimerDiff($lDeadlock) > $maxTime Or GetIsDead(-2)
		If TimerDiff($lDeadlock) > $maxTime Then ExitLoop
		If GetIsDead(-2) Then ExitLoop
		TargetNearestEnemy()
		Sleep(100)
		$nearestEnnemiAgentID = GetCurrentTargetID()
		$distanceToTarget = Target_GetDistanceToTarget()
	WEnd
	ClearTarget()
EndFunc ;~ Fight_FightingPattern

; Description : Ask the player to perfom a fighting action depending of his build.
Func Fight_DoActionToFight()
	Local $currentTargetAgent = GetCurrentTarget()
    Switch ($fightingPatternToUse)
        Case "NRPresearing"
            Fight_NRPreseringPattern($currentTargetAgent)
        Case "ADaggers"
            Fight_ADaggersPattern($currentTargetAgent)
        Case Else
            return
    EndSwitch
EndFunc ;~ Fight_DoActionToFight

; Description : Fight with the N/R Presearing Build.
Func Fight_NRPreseringPattern($currentTargetAgent)
	Local $idSkillToUse
	Local $targetToUse
	If GetHealth() < 400 And IsRecharged(4) Then 
		$idSkillToUse = 4
		$targetToUse = -2
	ElseIf GetHealth() < 350 And IsRecharged(7) Then 
		$idSkillToUse = 7
		$targetToUse = -2
	ElseIf IsRecharged(2) Then 
		$idSkillToUse = 2
        $targetToUse = $currentTargetAgent
	ElseIf IsRecharged(3) Then 
        $idSkillToUse = 3
        $targetToUse = $currentTargetAgent
	ElseIf IsRecharged(1) Then 
		$idSkillToUse = 1
        $targetToUse = -2
    Else
        return
    EndIf
	UseSkillEx($idSkillToUse, $targetToUse)
EndFunc

Func Fight_ADaggersPattern($currentTargetAgent)
	Local $arrayOfEffects = GetEffect()
	Local $hp = GetHealthPercent()
	Local $mp = GetEnergy()
	Local $daggerStatus = GetAgentDaggerStatus($currentTargetAgent)
	Local $idSkillToUse
	Local $targetToUse
	
	If $hp < 0.5 _
		And Not(Fight_EffectIsActive($arrayOfEffects, $assassinDaggerBuild[5 - 1])) _
			Then
		$idSkillToUse = 5
		$targetToUse = -2
	ElseIf IsRecharged(8) _
		And Not(Fight_EffectIsActive($arrayOfEffects, $assassinDaggerBuild[8 - 1])) _
			Then
		$idSkillToUse = 8
		$targetToUse = -2
	ElseIf IsRecharged(7) _
		And Not(Fight_EffectIsActive($arrayOfEffects, $assassinDaggerBuild[7 - 1])) _
			Then
		$idSkillToUse = 7
		$targetToUse = -2
	ElseIf IsRecharged(6) _
		And Not(Fight_EffectIsActive($arrayOfEffects, $assassinDaggerBuild[6 - 1])) _
			Then
		$idSkillToUse = 6
		$targetToUse = -2
	ElseIf IsRecharged(4) _
		And Not(Fight_EffectIsActive($arrayOfEffects, $assassinDaggerBuild[4 - 1])) _
			Then
		$idSkillToUse = 4
		$targetToUse = -2
	ElseIf $mp < 20 then ;~ When Mana is to low, only attack
		return
	ElseIf IsRecharged(3) _
		And $daggerStatus == 2 _
		Then
		$idSkillToUse = 3
		$targetToUse = $currentTargetAgent
	ElseIf IsRecharged(2) _
		And $daggerStatus == 1 _
		Then
		$idSkillToUse = 2
		$targetToUse = $currentTargetAgent
	ElseIf IsRecharged(1) _
		And Not($daggerStatus == 1 Or $daggerStatus == 2) _
		Then
		$idSkillToUse = 1
		$targetToUse = $currentTargetAgent
	Else
		Return
	EndIf
	UseSkillEx($idSkillToUse, $targetToUse)
	
EndFunc ;~ Fight_NRPreseringPattern

Func Fight_EffectIsActive($arrayOfEffects, $idSkill)
	For $i = 1 To UBound($arrayOfEffects) - 1
		Local $currentSkillId = DllStructGetData($arrayOfEffects[$i], 'SkillID')
		If $currentSkillId == $idSkill Then
			return true
		EndIf
	Next
	return false
EndFunc ;~ Fight_EffectIsAboutToEnd