;~ Description : Turn the player about the angle give (in degree). /!\ Not accurate depending on latency
Func Move_TurnLeft($angleOfTurn = 15)
    InitGUI_LogIntoGUIConsole("Turning Left !")

    ; 360° is roughly 3000ms but depend on server latency.
    $timeToSleep = ($angleOfTurn / 360) * 3000
    
    TurnLeft(true)
    Sleep($timeToSleep) 
    TurnLeft(false)
EndFunc ;~ Move_TurnLeft

;~ Description : Turn the player about the angle give (in degree). /!\ Not accurate depending on latency
Func Move_TurnRight($angleOfTurn = 15)
    InitGUI_LogIntoGUIConsole("Turning Right !")

    ; 360° is roughly 3000ms but depend on server latency.
    $timeToSleep = ($angleOfTurn / 360) * 3000
    
    TurnRight(true)
    Sleep($timeToSleep) 
    TurnRight(false)
EndFunc ;~ Move_TurnLeft

Func Move_GoForward($distanceToTravel = 500)
    MoveForward(false)
    InitGUI_LogIntoGUIConsole("Moving Forward !")
    Local $startingPosition = _Move_GetPlayerPosition()
    Local $startingX = $startingPosition[0]
    Local $startingY = $startingPosition[1]
    Local $traveledDistance = 0
    MoveForward(true)
    $i = 0
    While $traveledDistance < $distanceToTravel
        Local $currentPosition = _Move_GetPlayerPosition()
        Local $currentX = $currentPosition[0]
        Local $currentY = $currentPosition[1]
        $traveledDistance = Sqrt(($currentX - $startingX) ^ 2 + ($currentY - $startingY) ^ 2)
        Sleep(20)
        If DllStructGetData(GetAgentByID(), 'MoveX') == 0 And DllStructGetData(GetAgentByID(), 'MoveY') == 0 Then
            $i += 1
            if ($i > 10) then
                ExitLoop
            EndIf
        Else
            $i = 0
        EndIf
    WEnd
    MoveForward(false)
EndFunc ;~ Move_GoForward

Func Move_ReachOrEnemyNextToMe($aX, $aY, $aRandom = 50)
	Local $lBlocked = 0
	Local $lMe
	Local $lMapLoading = GetMapLoading(), $lMapLoadingOld
	Local $lDestX = $aX + Random(-$aRandom, $aRandom)
	Local $lDestY = $aY + Random(-$aRandom, $aRandom)

	Move($lDestX, $lDestY, 0)

    Local $lNumberOfFullCheck = 0
	Do
		Sleep(100)
		$lMe = GetAgentByID(-2)

        Local $lAgentArray = GetAgentArray()
        For $i = 0 To UBound($lAgentArray) - 1
            Local $lAllegiance = DllStructGetData($lAgentArray[$i], "Allegiance")
            ; Agents with "Allegiance = 3" are enemies to player.
            If GetIsDead($lAgentArray[$i]) Then ContinueLoop
            If $lAllegiance <> 3 Then ContinueLoop

            Local $lAgentX = DllStructGetData($lAgentArray[$i], "X")
            Local $lAgentY = DllStructGetData($lAgentArray[$i], "Y")
            Local $distance = ComputeDistance(DllStructGetData($lMe, 'X'), DllStructGetData($lMe, 'Y'), $lAgentX, $lAgentY)
            Local $lModelId = DllStructGetData($lAgentArray[$i], "PlayerNumber")

            If $distance < 1200 and Array_Contains($lModelId, $TargetModelId_EnemiesToAvoid_Array) Then
                Return -1
            EndIf

            If $distance < 1200 and ($lAllegiance == 3 Or Array_Contains($lModelId, $TargetModelId_EnemiesToKill_Array)) Then
                Return DllStructGetData($lAgentArray[$i], "ID")
            EndIf
        Next

		If DllStructGetData($lMe, 'HP') <= 0 Then ExitLoop

		$lMapLoadingOld = $lMapLoading
		$lMapLoading = GetMapLoading()
		If $lMapLoading <> $lMapLoadingOld Then ExitLoop

		If DllStructGetData($lMe, 'MoveX') == 0 And DllStructGetData($lMe, 'MoveY') == 0 Then
			$lBlocked += 1
			$lDestX = $aX + Random(-$aRandom, $aRandom)
			$lDestY = $aY + Random(-$aRandom, $aRandom)
			Move($lDestX, $lDestY, 0)
		EndIf
    Until ComputeDistance(DllStructGetData($lMe, 'X'), DllStructGetData($lMe, 'Y'), $lDestX, $lDestY) < 25 Or $lBlocked > 14
    Return 0
EndFunc ; Move_GoAndFightThrough

Func Move_GoToAndFightThrough($aX, $aY, $aRandom = 50)
    Local $resultMove = 1
    Do
        $resultMove = Move_ReachOrEnemyNextToMe($aX, $aY, $aRandom)
        If $resultMove == -1 Then 
            Return -1
        ElseIf $resultMove <> 0 Then
            Fight_FightingPattern($resultMove)
                If GetIsDead(-2) Then Return -1
            Target_PickUpLoot()
                If GetIsDead(-2) Then Return -1
    EndIf
    Until $resultMove == 0 or $resultMove == -1
EndFunc ; Move_GoToAndFightThrough

;~ Description : Return the X and Y value of the player position in a table.
Func _Move_GetPlayerPosition()
    Local $agentPlayer = GetAgentByID()
    Local $x = DllStructGetData($agentPlayer, 'X')
    Local $y = DllStructGetData($agentPlayer, 'Y')
    Local $return[2]
    $return[0] = $x
    $return[1] = $y
    Return $return
EndFunc ;~ _Move_GetPlayerPosition