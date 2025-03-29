#include "../../../Start/Start.au3"
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GuiComboBox.au3>
#include "CommonFunction.au3"
#include "AddsOn.au3"

global $DeadOnTheRun = 0,$tpspirit = 0, $WeAreDead
global $intrun = 0, $pick_are_here

;~ BUILD CODE
;~ OwBj0tf44S3lTQAAAAAAAAAAAAA

While 1
	$NumberRun = 0
	$DeldrimorMade = 0
	$IDKitBought = 0
	$RunSuccess = 0
	$boolrun = True

	GUICtrlSetState($Start, $GUI_DISABLE)
	GUICtrlSetState($txtName, $GUI_DISABLE)
	If GUICtrlRead($txtName) = "" Then
		If Initialize(ProcessExists("gw.exe")) = False Then
			MsgBox(0, "Error", "Guild Wars it not running.")
			Exit
		EndIf
	Else
		If Initialize(GUICtrlRead($txtName), "Guild Wars - " & GUICtrlRead($txtName)) = False Then
			MsgBox(0, "Error", "Can't find a Guild Wars client with that character name.")
			Exit
		EndIf
	EndIf

	If $boolrun = true Then
		If $NumberRun = 0 Then
			AdlibRegister("status", 1000)
			$TimerTotal = TimerInit()
			FileOpen($File)
		EndIf
		If GetMapID() <> 675 Then
			CurrentAction("Moving to Outpost")
			ZoneMap(675, 0)
			WaitForLoad()
			rndslp(4000)
			$intrun = 0
		EndIf
		rndslp(3000)
		If GetGoldCharacter()>80000 Then
			CurrentAction("Depositing gold")
			DepositGold(70000)
		EndIf
		rndslp(3000)
		$NumberRun = $NumberRun +1
		$intrun = $intrun + 1
		If GUICtrlRead($Breaks) = $GUI_CHECKED Then
			$RandomBreak = Random(1, 30, 1)
			If $RandomBreak = 10 Then
				CurrentAction("break")
				Switch (Random(1, 3, 1))
					Case 1
						Sleep(Random(10000, 20000))
					Case 2
						Sleep(Random(20000, 30000))
					Case 3
						Sleep(Random(30000, 50000))
				EndSwitch
			ElseIf $RandomBreak = 20 Then
				CurrentAction("big break")
				Sleep(Random(75000, 99000))
			EndIf
		EndIf
		CurrentAction("Begin run number " & $NumberRun)
		If CheckIfInventoryIsFull() then SellItemToMerchant()
		$pick_are_here = False
		CheckIfInventoryPick(1, 20)
		CheckIfInventoryPick(2, 5)
		CheckIfInventoryPick(3, 10)
		CheckIfInventoryPick(4, 10)
;~ 		If $pick_are_here = False Then
;~ 			MsgBox("","","No More LockPick In Inventory")
;~ 			Exit
;~ 		EndIf
		GoOut()
		ChestRun()
	EndIf
	sleep(50)
WEnd

Func CheckIfInventoryPick($bagIndex, $numOfSlots)
	For $i = 1 To $numOfSlots
		$aItem = GetItemBySlot($bagIndex, $i)
		If DllStructGetData($aItem, 'ID') <> 0 And DllStructGetData($aitem, 'ModelID') = 22751 Then
			$pick_are_here = True
		EndIf
	Next
EndFunc

Func GoOut()
	CurrentAction("Switch mode")
	If GUICtrlRead($HM) = $GUI_CHECKED Then
		SwitchMode(1)
	Else
		SwitchMode(0)
	EndIf
	RndSleep(250)
	If $intrun = 1 Then
		moveto(7603, -27423)
	EndIf
	CurrentAction("Going out")
	Switch (Random(1, 8, 1))
		Case 1
			Move(4733.52, -27842.97)
		Case 2
			Move(4730.40, -27788.09)
		Case 3
			Move(4700.77, -27976.07)
		Case 4
			Move(4720.88, -27892.77)
		Case 5
			Move(4720.72, -27858.23)
		Case 6
			Move(4725.52, -27856.53)
		Case 7
			Move(4729.92, -27858.23)
		Case 8
			Move(4738.72, -27877.23)
	EndSwitch
	WaitForLoad()
	rndslp(5000)
	CurrentAction("Moving Back")
	If $intrun = 1 Then
		Move(4776, -27888)
		WaitForLoad()
		rndslp(5000)
		CurrentAction("Going out")
		Switch (Random(1, 8, 1))
			Case 1
				Move(4733.52, -27842.97)
			Case 2
				Move(4730.40, -27788.09)
			Case 3
				Move(4700.77, -27976.07)
			Case 4
				Move(4720.88, -27892.77)
			Case 5
				Move(4720.72, -27858.23)
			Case 6
				Move(4725.52, -27856.53)
			Case 7
				Move(4729.92, -27858.23)
			Case 8
				Move(4738.72, -27877.23)
		EndSwitch
		WaitForLoad()
		rndslp(5000)
	EndIf
EndFunc

Func Running()
	local $me = GetAgentByID(-2)
	If DllStructGetData(GetSkillbar(), 'Recharge2') = 0 AND  DllStructGetData($me, 'EnergyPercent') >= 0.10 And $WeAreDead = False Then
		If DllStructGetData(GetSkillbar(), 'Recharge1') = 0 AND DllStructGetData($me, 'EnergyPercent') >= 0.10 And $WeAreDead = False Then
			UseSkill(1, 0)
			rndslp(800)
		EndIf
		UseSkill(2, 0)
		rndslp(100)
	EndIf
EndFunc

Func ChestRun()
	$WeAreDead = False
	AdlibRegister("CheckDeath", 1000)
	AdlibRegister("Running", 1000)
	If Not $WeAreDead then CurrentAction("Waypoint 1")
	local $me = GetAgentByID(-2)
	If DllStructGetData(GetSkillbar(), 'Recharge1') = 0 AND  DllStructGetData($me, 'EnergyPercent') >= 0.10 And $WeAreDead = False Then
		UseSkill(1, 0)
		rndslp(800)
	EndIf

	Switch (Random(1, 5, 1))
		Case 1
			Dim $wp[2] = [2942, -25733]
		Case 2
			Dim $wp[2] = [2884.05, -25826.86]
		Case 3
			Dim $wp[2] = [2876.13, -25690.62]
		Case 4
			Dim $wp[2] = [2899.05, -25801.86]
		Case 5
			Dim $wp[2] = [2913.13, -25745.62]
	EndSwitch

	If Not $WeAreDead then MoveTo($wp[0], $wp[1])
	If Not $WeAreDead then CurrentAction("Waypoint 2")

	Switch (Random(1, 5, 1))
		Case 1
			Dim $wp[2] = [434, -20716]
		Case 2
			Dim $wp[2] = [427, -20705]
		Case 3
			Dim $wp[2] = [445, -20729]
		Case 4
			Dim $wp[2] = [420, -20710]
		Case 5
			Dim $wp[2] = [438, -20720]
	EndSwitch
	If Not $WeAreDead then MoveTo($wp[0], $wp[1])
	If Not $WeAreDead then CurrentAction("Waypoint 3")

	Switch (Random(1, 5, 1))
		Case 1
			Dim $wp[2] = [-3391, -18043]
		Case 2
			Dim $wp[2] = [-3380, -18033]
		Case 3
			Dim $wp[2] = [-3399, -18055]
		Case 4
			Dim $wp[2] = [-3384, -18020]
		Case 5
			Dim $wp[2] = [-3405, -18060]
	EndSwitch
	If Not $WeAreDead then MoveTo($wp[0], $wp[1])

	If Not $WeAreDead then TargetNearestItem()
	If Not $WeAreDead then rndslp(500)
	If DllStructGetData(GetCurrentTarget(), 'Type') = 512 and $WeAreDead = False Then
		If Not $WeAreDead then DoChest()
		If Not $WeAreDead then rndslp(800)
	EndIf
	If Not $WeAreDead then CurrentAction("Waypoint 4")
	Switch (Random(1, 5, 1))
		Case 1
			Dim $wp[2] = [-4950, -14890]
		Case 2
			Dim $wp[2] = [-4937, -14877]
		Case 3
			Dim $wp[2] = [-4965, -14911]
		Case 4
			Dim $wp[2] = [-4944, -14900]
		Case 5
			Dim $wp[2] = [-4959, -14906]
	EndSwitch
	If Not $WeAreDead then MoveTo($wp[0], $wp[1])

	If Not $WeAreDead then TargetNearestItem()
	If Not $WeAreDead then rndslp(500)
	If DllStructGetData(GetCurrentTarget(), 'Type') = 512 and $WeAreDead = False Then
		If Not $WeAreDead then DoChest()
		If Not $WeAreDead then rndslp(800)
	EndIf

	If Not $WeAreDead then CurrentAction("Waypoint 5")
	Switch (Random(1, 5, 1))
		Case 1
			Dim $wp[2] = [-5725, -12445]
		Case 2
			Dim $wp[2] = [-5745, -12430]
		Case 3
			Dim $wp[2] = [-5700, -12442]
		Case 4
			Dim $wp[2] = [-5712, -12453]
		Case 5
			Dim $wp[2] = [-5732, -12425]
	EndSwitch
	If Not $WeAreDead then MoveTo($wp[0], $wp[1])

	If Not $WeAreDead then TargetNearestItem()
	If Not $WeAreDead then rndslp(500)
	If DllStructGetData(GetCurrentTarget(), 'Type') = 512 and $WeAreDead = False Then
		If Not $WeAreDead then DoChest()
		If Not $WeAreDead then rndslp(800)
	EndIf

	AdlibUnRegister("CheckDeath")
	AdlibUnRegister("Running")
	Do
		Resign()
		rndslp(3000)
	Until GetIsDead(-2) = 1
	rndslp(4000)
	ReturnToOutpost()
	WaitForLoad()
EndFunc

Func DoChest()
	CurrentAction(DllStructGetData(GetItemBySlot(4,10),'quantity'))
	If Not $WeAreDead then CurrentAction("Going To open This chest")
	If Not $WeAreDead then GoSignpost(-1)
	local $TimeCheck = TimerInit()
	If Not $WeAreDead then $chest = GetCurrentTarget()
	If Not $WeAreDead then $oldCoordsX = DllStructGetData($chest, "X")
	If Not $WeAreDead then $oldCoordsY = DllStructGetData($chest, "Y")
	If Not $WeAreDead then
		Do
	        If Not $WeAreDead then GoSignpost(-1)
			rndslp(500)
		Until CheckArea($oldCoordsX, $oldCoordsY) Or TimerDiff($TimeCheck) > 90000 Or $WeAreDead
	EndIf
	If Not $WeAreDead then rndslp(2000)
	InitLockpicks()
	If Not $WeAreDead then OpenChest()
	If Not $WeAreDead then rndslp(1000)
	CheckLockpicks()
	If Not $WeAreDead then TargetNearestItem()
	If Not $WeAreDead then rndslp(500)
	If Not $WeAreDead then $item = GetCurrentTarget()
	$TimeCheck = TimerInit()
	If Not $WeAreDead then
		Do
			If Not $WeAreDead then rndslp(500)
			If Not $WeAreDead then PickUpItem($item)
		Until DllStructGetData($item, 'AgentID') = 0 Or TimerDiff($TimeCheck) > 90000 or $WeAreDead
	EndIf
EndFunc   ;==>DoChest

Func status()
	$time = TimerDiff($TimerTotal)
	$string = StringFormat("min: %03u  sec: %02u ", $time/1000/60, Mod($time/1000,60))
	GUICtrlSetData($label_stat, $string)
EndFunc    ;==>status

Func CheckDeath()
	If Death() = 1 Then
		$WeAreDead = True
		CurrentAction("We Are Dead")
	EndIf
EndFunc   ;==>CheckDeath