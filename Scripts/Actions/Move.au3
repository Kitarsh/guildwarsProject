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