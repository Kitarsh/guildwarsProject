#include-once

Global $strName = ""
Global $NumberRun = 0, $DeldrimorMade = 0, $IDKitBought = 0, $RunSuccess = 0
global $boolrun = False
Global $strName = ""
global $nb_of_lockpicks
global $broken_picks = 0, $retain_picks = 0
Global $File = @ScriptDir & "\Trace\Traça du " & @MDAY & "-" & @MON & " a " & @HOUR & "h et " & @MIN & "minutes.txt"

Opt("GUIOnEventMode", 1)

#Region ### START Koda GUI section ### Form=C:\Bot GW\Feather Farm\Storage version \Form1.kxf
Global $win = GUICreate("Status Window Globeul", 274, 270 + 20+45, 500, 1)
GUICtrlCreateLabel("Globeul", 180, 180-70-30+45,80)
GUICtrlSetFont(-1, 15)
$Start = GUICtrlCreateButton("Start", 178, 250-90-50+45, 75, 25, $WS_GROUP)
GUICtrlSetOnEvent(-1, "gui_eventHandler")
GUICtrlCreateGroup("Status: Runs", 275-265, 8, 255, 105)
GUICtrlCreateLabel("Total Runs:", 285-265, 28, 70, 17)
global $gui_status_runs = GUICtrlCreateLabel("0", 355-265, 28, 40, 17, $SS_RIGHT)
GUICtrlCreateLabel("Kits Bought:", 410-265, 28, 70, 17)
global $gui_status_kit = GUICtrlCreateLabel("0", 480-265, 28, 40, 17, $SS_RIGHT)
GUICtrlCreateLabel("Lockpicks retain:", 20, 48, 200, 17)
global $gui_retain_lockpicks = GUICtrlCreateLabel("0", 215, 48, 40, 17, $SS_RIGHT)
GUICtrlCreateLabel("Lockpicks broken:", 20, 68, 200, 17)
global $gui_broken_lockpicks = GUICtrlCreateLabel("0", 215, 68, 40, 17, $SS_RIGHT)
GUICtrlCreateLabel("% of retain:", 20, 88, 70, 17)
global $gui_percent_lockpicks = GUICtrlCreateLabel("0", 90, 88, 165, 17, $SS_RIGHT)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Store = GUICtrlCreateCheckbox("Store Gold", 370-265-60, 285-132-35-15+35-60+45, 80, 17)
$Breaks = GUICtrlCreateCheckbox("Breaks", 370-265-60, 285-132-35-15+35-45+45, 80, 17)
$BuyPick = GUICtrlCreateCheckbox("Buy Lockpicks", 370-265-60, 285-132-35-15+35-30+45, 80, 17)
$HM = GUICtrlCreateCheckbox("HM", 370-265-60, 285-132-35-15+35-15+45, 80, 17)
GUICtrlCreateGroup("Status: Time", 10, 310 - 90 - 75 + 20+45, 255, 43)
GUICtrlCreateLabel("Total:", 20, 330 - 90 - 75 + 20+45, 50, 17)
Global $label_stat = GUICtrlCreateLabel("min: 000  sec: 00", 70, 330 - 90 - 75 + 20+45)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$txtName = GUICtrlCreateInput($strName, 60, 330 - 90 - 45 + 20+45, 150 , 20)
GUICtrlCreateGroup("Status: Current Action", 10, 375 - 90 - 65 + 20+45, 255, 45)
Global $STATUS = GUICtrlCreateLabel("Script not started yet", 20, 390 - 90 - 65 + 20+45, 235, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetOnEvent($GUI_EVENT_CLOSE, "gui_eventHandler")
;~ GUICtrlSetState($Store, $GUI_CHECKED) // Store golds uncheck by default
GUICtrlSetState($HM, $GUI_CHECKED)
GUICtrlSetState($BuyPick, $GUI_DISABLE)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

func gui_eventHandler()
	switch (@GUI_CtrlId)
		case $GUI_EVENT_CLOSE
			exit
		case $Start
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
	endswitch
endfunc


Func CurrentAction($MSG)
	GUICtrlSetData($STATUS, $MSG)
	GUICtrlSetData($gui_status_runs, $NumberRun)
	GUICtrlSetData($gui_status_kit, $IDKitBought)
	GUICtrlSetData($gui_retain_lockpicks, $retain_picks)
	GUICtrlSetData($gui_broken_lockpicks, $broken_picks)
	if($broken_picks+$retain_picks) = 0 then
		GUICtrlSetData($gui_percent_lockpicks, 0)
	else
		GUICtrlSetData($gui_percent_lockpicks, $retain_picks/($broken_picks+$retain_picks)*100)
	endif
	;GUICtrlSetData($gui_percent_lockpicks, $retain_picks/($broken_picks+$retain_picks))
	FileWriteLine($File, "Run : " & $NumberRun & " à : " & @Hour & ":" & @MIN & "." & @Sec & "   " & $MSG & @CRLF)
EndFunc   ;==>CurrentAction

Func InitLockpicks()
	$nb_of_lockpicks = DllStructGetData(GetItemBySlot(4,10),'quantity')
EndFunc


Func CheckLockpicks()
    local $newnumberlockpicks = DllStructGetData(GetItemBySlot(4,10),'quantity')
	if $newnumberlockpicks = $nb_of_lockpicks then  
		$retain_picks += 1
	else
		$broken_picks += 1
		$nb_of_lockpicks = DllStructGetData(GetItemBySlot(4,10),'quantity')
	endif
EndFunc ;==> CheckLockpicks


;~ Func BuyItemToMerchant()
;~ 	moveto(7603, -27423)
;~ 	rndslp(500)
;~ 	If GUICtrlRead($BuyPick) = $GUI_CHECKED Then
;~ 		CurrentAction("Going to buy pick")
;~ 		GoMerchant(6150, 7319, -24874)
;~
;~ 			If GetGoldCharacter() < 1500 Then
;~ 				If GetGoldStorage() > 1500 Then
;~ 					Update("Grabbing gold")
;~ 					RndSleep(250)
;~ 					WithdrawGold(1500)
;~ 					RndSleep(250)
;~ 				Else
;~ 					MsgBox("","","Out Of Money")
;~ 					Exit
;~ 				EndIf
;~ 			EndIf
;~ 			BuyItem(11, 1, 1500)
;~ 			RndSleep(500)
;~ 		Next
;~ 		Do
;~ 			If GetGoldCharacter() < 1500
;~ 				If GetGoldStorage() > 1500 Then
;~ 					Update("Grabbing gold")
;~ 					RndSleep(250)
;~ 					WithdrawGold(1500)
;~ 					RndSleep(250)
;~ 				EndIf
;~ 	Else
;~ 		MsgBox("","","No More Pick and You dont check to buy")
;~ 		Exit
;~ 	EndIf
;~ 	rndslp(5000)
;~ 	moveto(7603, -27423)
;~ EndFunc  ;==>SellItemToMerchant

Func SellItemToMerchant()
	CurrentAction("Storing Gold Unid")
	If GUICtrlRead($Store) = $GUI_CHECKED Then StoreGolds()
	RNDSLP(1000)
	CurrentAction("Going to merchant")
	$merchant = GetNearestNPCToCoords(7319, -24874)
	RNDSLP(1000)
	moveto(7603, -27423)
	GoToNPC($merchant)
	BuyIDKit()
	$IDKitBought = $IDKitBought + 1
	RNDSLP(1000)
	CurrentAction("Ident inventory")
	Ident(1)
	Ident(2)
	Ident(3)
	Ident(4)
	CurrentAction("Sell inventory")
	Sell(1)
	Sell(2)
	Sell(3)
	Sell(4)
	moveto(7603, -27423)
EndFunc  ;==>SellItemToMerchant

Func IDENT($bagIndex)
	$bag = GetBag($bagIndex)
	For $i = 1 To DllStructGetData($bag, 'slots')
		If FindIDKit() = 0 Then
			If GetGoldCharacter() < 500 And GetGoldStorage() > 499 Then
				WithdrawGold(500)
				Sleep(Random(200, 300))
			EndIf
			local $J = 0
			Do
				BuyIDKit()
				RndSleep(500)
				$J = $J+1
			Until FindIDKit() <> 0 OR $J = 3
			If $J = 3 Then ExitLoop
			RndSleep(500)
		EndIf
		$aitem = GetItemBySlot($bagIndex, $i)
		If DllStructGetData($aitem, 'ID') = 0 Then ContinueLoop
		IdentifyItem($aitem)
		Sleep(Random(400, 750))
	Next
EndFunc   ;==>IDENT

Func Sell($bagIndex)
	$bag = GetBag($bagIndex)
	$numOfSlots = DllStructGetData($bag, 'slots')
	For $i = 1 To $numOfSlots
		CurrentAction("Selling item: " & $bagIndex & ", " & $i)
		$aitem = GetItemBySlot($bagIndex, $i)
		If DllStructGetData($aitem, 'ID') = 0 Then ContinueLoop
		If CanSell($aitem) Then
			SellItem($aitem)
		EndIf
		RndSleep(250)
	Next
EndFunc   ;==>Sell


Func CanSell($aitem)
	local $m = DllStructGetData($aitem, 'ModelID')
	local $i = DllStructGetData($aitem, 'extraId')
	If $m = 0 Then
		Return False
	ElseIf $m > 21785 And $m < 21806 Then ;Elite/Normal Tomes
		Return False
	ElseIf $m = 146 Then
		If $i = 10 OR $i = 12 Then ;black and white
			Return False
		Else
			Return True
		EndIf
	ElseIf $m =  6533 Then
		Return False    ;jade
	ElseIf $m =  929 or $m =  441 Then
		Return False    ;dust and remnants
	ElseIf $m = 22751 then ;pick
		Return False
	Else
		Return True
	EndIf
EndFunc   ;==>CanSell

Func GoMerchant($id_merchant, $xmerchant, $ymerchant)
	Local $lNearestAgent, $lNearestDistance = 100000000
	Local $lDistance, $lAgentToCompare

	For $i = 1 To GetMaxAgents()
		$lAgentToCompare = GetAgentByID($i)
		If DllStructGetData($lAgentToCompare, 'PlayerNumber') <> $id_merchant then ContinueLoop
		rndslp(150)
		ChangeTarget($lAgentToCompare)
		rndslp(150)
		GoNPC($lAgentToCompare)
		ExitLoop
	Next
	Do
		rndslp(100)
	Until CheckArea($xmerchant, $ymerchant)
	rndslp(2000)
EndFunc

Func StoreGolds()
	GoldIs(1, 20)
	GoldIs(2, 5)
	GoldIs(3, 10)
EndFunc

Func GoldIs($bagIndex, $numOfSlots)
	For $i = 1 To $numOfSlots
		ConsoleWrite("Checking items: " & $bagIndex & ", " & $i & @CRLF)
		$aItem = GetItemBySlot($bagIndex, $i)
		If DllStructGetData($aItem, 'ID') <> 0 And DllStructGetData(GetExtraItemInfoBySlot($bagIndex, $i), 'rarity') = $RARITY_Gold Then
				Do
					For $bag = 8 To 12; Storage panels are form 8 till 16 (I have only standard amount plus aniversary one)
						$slot = FindEmptySlot($bag)
						$slot = @extended
						If $slot <> 0 Then
							$FULL = False
							$nSlot = $slot
							ExitLoop 2; finding first empty $slot in $bag and jump out
						Else
							$FULL = True; no empty slots :(
						EndIf
						Sleep(400)
					Next
				Until $FULL = True
				If $FULL = False Then
					MoveItem($aItem, $bag, $nSlot)
					ConsoleWrite("Gold item moved ...."& @CRLF)
					Sleep(Random(450, 550))
				EndIf
		EndIf
	Next
EndFunc   ;==>GoldIs

Func CheckIfInventoryIsFull()
	If CountSlots() = 0 Then
		CurrentAction("Inventory Is Full")
		return true
	Else
		return false
	EndIf
EndFunc   ;==>CheckIfInventoryIsFull

Func WaitForLoad()
	CurrentAction("Loading zone")
	InitMapLoad()
	$deadlock = 0
	Do
		Sleep(100)
		$deadlock += 100
		$load = GetMapLoading()
		$lMe = GetAgentByID(-2)

	Until $load = 2 And DllStructGetData($lMe, 'X') = 0 And DllStructGetData($lMe, 'Y') = 0 Or $deadlock > 20000

	$deadlock = 0
	Do
		Sleep(100)
		$deadlock += 100

		$deadlock += 100
		$load = GetMapLoading()
		$lMe = GetAgentByID(-2)

	Until $load <> 2 And DllStructGetData($lMe, 'X') <> 0 And DllStructGetData($lMe, 'Y') <> 0 Or $deadlock > 30000
	CurrentAction("Load complete")
EndFunc   ;==>WaitForLoad

Func CountSlots()
	Local $bag
	Local $temp = 0
	$bag = GetBag(1)
	$temp += DllStructGetData($bag, 'slots') - DllStructGetData($bag, 'ItemsCount')
	$bag = GetBag(2)
	$temp += DllStructGetData($bag, 'slots') - DllStructGetData($bag, 'ItemsCount')
	$bag = GetBag(3)
	$temp += DllStructGetData($bag, 'slots') - DllStructGetData($bag, 'ItemsCount')
	Return $temp
EndFunc   ;==>CountSlots