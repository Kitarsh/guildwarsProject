#include <GUIConstantsEx.au3>
#include <Process.au3>
#include <Array.au3>
; -- This file will mostly fill this value with the selected process by the user. Use it to run the game.
Global $iSelectedPID

; --- Configuration ---
Local $g_ProcessName = "Gw.exe"
Local $g_WindowTitle = "Select " & $g_ProcessName & " Process"
Local $g_WindowWidth = 300
Local $g_WindowHeight = 150 ; Adjust height for the dropdown

; --- Global Variables ---
Local $g_hGUI
Local $g_ComboProcesses
Local $g_ButtonSelect
Local $g_ButtonCancel
Local $g_aProcessList

; --- Functions ---

;Function for getting HWND from PID
Func _GetHwndFromPID($PID)
	$hWnd = 0
	$winlist = WinList()
	Do
		For $i = 1 To $winlist[0][0]
			If $winlist[$i][0] <> "" Then
				$iPID2 = WinGetProcess($winlist[$i][1])
				If $iPID2 = $PID Then
					$hWnd = $winlist[$i][1]
					ExitLoop
				EndIf
			EndIf
		Next
	Until $hWnd <> 0
	Return $hWnd
EndFunc;==>_GetHwndFromPID

; Function to get a list of PIDs for a given process name
Func _GetProcessList($sProcessName)
    Local $aPIDList = ProcessList($sProcessName)
    If @error Then Return 0 ; Error occurred
    If UBound($aPIDList, 1) <= 1 Then Return 0 ; No matching processes found
    Return $aPIDList
EndFunc

Func _PopulateWindowCombo()
    $processList = _GetProcessList($g_ProcessName)
    If Not IsArray($processList) Then
        GUICtrlSetData($g_ComboProcesses, "No '" & $g_ProcessName & "' windows found.")
        GUICtrlSetState($g_ButtonSelect, $GUI_DISABLE)
        Return
    EndIf

    GUICtrlSetData($g_ComboProcesses, "")
    For $i = 1 To $processList[0][0]
        Local $Pid = $processList[$i][1]
        Local $whan = _GetHwndFromPID($Pid)
        Local $wTitle = WinGetTitle($whan)
        Local $displayValue = $wTitle & ":" & $Pid
        GUICtrlSetData($g_ComboProcesses, $displayValue)
    Next
    GUICtrlSetState($g_ButtonSelect, $GUI_ENABLE)
EndFunc


Func ProcessSelector()
    ; Create the GUI
    $g_hGUI = GUICreate($g_WindowTitle, $g_WindowWidth, $g_WindowHeight)

    ; Create the combobox to display processes
    $g_ComboProcesses = GUICtrlCreateCombo("", 10, 10, $g_WindowWidth - 20, 25)

    ; Create the "Select" button
    $g_ButtonSelect = GUICtrlCreateButton("Select", 10, $g_WindowHeight - 45, 100, 30)
    GUICtrlSetState($g_ButtonSelect, $GUI_DISABLE) ; Initially disabled

    ; Create the "Cancel" button
    $g_ButtonCancel = GUICtrlCreateButton("Cancel", $g_WindowWidth - 110, $g_WindowHeight - 45, 100, 30)

    ; Populate the process list
    _PopulateWindowCombo()

    ; Show the GUI
    GUISetState(@SW_SHOW, $g_hGUI)

    ; --- Event Loop ---
    Local $Gui_killLoop = false
    While $Gui_killLoop = false
        Local $msg = GUIGetMsg()
        Switch $msg
            Case $GUI_EVENT_CLOSE, $g_ButtonCancel
                $Gui_killLoop = true
            Case $g_ButtonSelect
                Local $sSelectedText = GUICtrlRead($g_ComboProcesses)
                If $sSelectedText <> "" And $sSelectedText <> "No '" & $g_ProcessName & "' processes found." Then
                    Local $aParts = StringSplit($sSelectedText, ":", 2)
                    If UBound($aParts) >= 1 Then
                        If StringIsInt($aParts[1]) Then; The PID should be the second part
                            $iSelectedPID = Number($aParts[1])
                            Local $wHan = _GetHwndFromPID($iSelectedPID)
                            Local $wName = WinGetTitle($wHan)
                            $Gui_killLoop = true
                        Else
                            MsgBox(16, "Error", "Could not extract a valid PID.")
                EndIf
                    Else
                        MsgBox(16, "Error", "Selected text format is unexpected.")
                    EndIf
                Else
                    MsgBox(48, "Information", "Please select a process from the dropdown list.")
                EndIf
        EndSwitch
    WEnd
    GUIDelete($g_hGUI)
EndFunc ; ==> ProcessSelector