Global $BaseGUI_GuiIndex_timer
Global $BaseGUI_GuiIndex_deaths
Global $BaseGUI_GuiIndex_CounterOne
Global $BaseGUI_GuiIndex_CounterTwo
Global $BaseGUI_GuiIndex_Console
Global $BaseGUI_Timer_Value = TimerInit()
Global $BaseGUI_Deaths_Value = 0
Global $BaseGUI_CounterOne_Value = 0
Global $BaseGUI_CounterTwo_Value = 0
Global $BaseGUI_KillMainLoop = false


Func BaseGUI_Init($name = 'Guild Wars Project', $counterOneName = "Counter One", $counterTwoName = "Counter Two")
    Opt("GUIOnEventMode", 1)
    GUICreate($name, 200, 400, -1, -1)
    $verticalpos = 10
    GUICtrlCreateLabel("Timer", 10, $verticalpos, 40, 25)
    $BaseGUI_GuiIndex_timer = GUICtrlCreateLabel("000d 00h 00min", 50, $verticalpos, 140, 25, $SS_RIGHT)

    $verticalpos = $verticalpos + 15 + 10
    GUICtrlCreateLabel("Deaths", 10, $verticalpos, 40, 25)
    $BaseGUI_GuiIndex_deaths = GUICtrlCreateLabel("0000", 50, $verticalpos, 140, 25, $SS_RIGHT)

    $verticalpos = $verticalpos + 15 + 10
    GUICtrlCreateLabel($counterOneName, 10, $verticalpos, 80, 25)
    $BaseGUI_GuiIndex_CounterOne = GUICtrlCreateLabel("0000", 90, $verticalpos, 100, 25, $SS_RIGHT)
    
    $verticalpos = $verticalpos + 15 + 10
    GUICtrlCreateLabel($counterTwoName, 10, $verticalpos, 80, 25)
    $BaseGUI_GuiIndex_CounterTwo = GUICtrlCreateLabel("0000", 90, $verticalpos, 100, 25, $SS_RIGHT)

    
    $BaseGUI_GuiIndex_Console = GUICtrlCreateEdit("", 10, 110, 180, 280)

    GUISetOnEvent($GUI_EVENT_CLOSE, "BaseGUI_local_EventHandler") ;~ $GUI_EVENT_CLOSE
    GUISetState(@SW_SHOW)
EndFunc; BaseGUI_Init()

Func BaseGUI_Update()
    BaseGUI_local_TimerUpdateDisplay()
    BaseGUI_local_DeathsUpdateDisplay()
    BaseGUI_local_CounterUpdateDisplay()
EndFunc; BaseGUI_Update

; Description : Log the value in the GUI Console.
Func BaseGUI_ConsoleLog($value = '')
    $editValue = GUICtrlRead($BaseGUI_GuiIndex_Console)
    If StringLen($editValue) > 20000 Then 
        $editValue = StringTrimLeft($editValue, 1000)
        GUICtrlSetData($BaseGUI_GuiIndex_Console, $editValue) ; Resetting the full value
    EndIf
    $nowTime = _NowTime(4)
    If $editValue == '' Then
        $newEditValue = '[' & $nowTime & '] ' & $value
    Else
        $newEditValue = @CRLF & '[' & $nowTime & '] ' & $value
    EndIf
    GUICtrlSetData($BaseGUI_GuiIndex_Console, $newEditValue, 1) ; 1 here is to add at the end of the current value
EndFunc ;~ BaseGUI_LogIntoGUIConsole

#Region Local
Func BaseGUI_local_EventHandler()
	;After every loop check if the user clicked something in the GUI window
    $iMsg = @GUI_CtrlId
    Select
        ;Check if user clicked on the close button
        Case $iMsg = $GUI_EVENT_CLOSE
            ;Destroy the GUI including the controls
            $BaseGUI_KillMainLoop = true
            GUIDelete()
            Exit
            ;Exit the script
    EndSelect
EndFunc; BaseGUI_local_EventHandler

Func BaseGUI_local_TimerUpdateDisplay()
	$time = TimerDiff($BaseGUI_Timer_Value)
    $minutes = Mod($time/1000/60,60)
    $hours = Mod($time/1000/60/60,60)
    $days = $time/1000/60/60/24
	$string = StringFormat("%03ud %02uh %02umin", $days, $hours, $minutes)
	GUICtrlSetData($BaseGUI_GuiIndex_timer, $string)
EndFunc; BaseGUI_local_TimerUpdateDisplay

Func BaseGUI_local_DeathsUpdateDisplay()
    $string = StringFormat("%04u", $BaseGUI_Deaths_Value)
	GUICtrlSetData($BaseGUI_GuiIndex_deaths, $string)
EndFunc; BaseGUI_local_DeathsUpdateDisplay

Func BaseGUI_local_CounterUpdateDisplay()
    $string = StringFormat("%04u", $BaseGUI_CounterOne_Value)
	GUICtrlSetData($BaseGUI_GuiIndex_CounterOne, $string)
    $string = StringFormat("%04u", $BaseGUI_CounterTwo_Value)
	GUICtrlSetData($BaseGUI_GuiIndex_CounterTwo, $string)
EndFunc; BaseGUI_local_CounterUpdateDisplay

#EndRegion Local
