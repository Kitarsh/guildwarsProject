#cs 
Chest Runner Boreal (Derv&sin) v0.24 -- 29/04/2025

Skill Template:
Ogej4NfMLT3ljbHYAAAAAAAAAAA     (derv)
OwZjgwf84Q3l0kTQAAAAAAAAAAA  (sin)

The bot will use Blue Drink if present in your inventory.

The bot will terminate when you run out of lockpicks.

The bot can occasionally die.
#ce

#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Date.au3>
#include <Array.au3>
#include <_constants.au3>
#include <_Runes_and_Insignias.au3>
#include <GWA2_Headers.au3>
#include <GWA2.au3>
#include <GWA2_20th_Anniversary.au3>
#include <functions.au3>

#NoTrayIcon

#AutoIt3Wrapper_UseX64=n

AutoItSetOption("TrayIconDebug", 1);

Opt("GUIOnEventMode", True)
Opt("GUICloseOnESC", False)
Opt("MustDeclareVars", True)

#Region Declarations
; >>>> Settings >>>>
; ==== Pick up behaviour ====


Func GetProfUpgrade($aItem, $bSoulReaping = True, $bEnergyStorage = False, $bFastCasting = False)
    Local $lMod = GetModByIdentifier($aItem, "A828")
    If Not IsArray($lMod) Then Return False

    If $lMod[0] = 5 Then
        If ($lMod[1] = $ATTRIBUTE_SOUL_REAPING And $bSoulReaping) Or _
           ($lMod[1] = $ATTRIBUTE_ENERGY_STORAGE And $bEnergyStorage) Or _
           ($lMod[1] = $ATTRIBUTE_FAST_CASTING And $bFastCasting) Then
            Return True
        EndIf
    EndIf

    Return False
EndFunc


; ==== Set Skill Variables ====
Global Enum $STAB = 1, $ZEAL, $PIOUS
; ==== Pick up behaviour ====
Global $PickUpGolds = True			;golden items
Global $PickUpEliteTomes = True		;elite tomes
Global $PickUpNormalTomes = True	;regular tomes
; ==== Misc Stuff ====
Global $UseBags = 3	;[1..X] How many of your inventory bags will be used (stuff in there will be sold!)
Global $UseHardMode = True	;True if you want to run in HM by default, False for NM
Global $ShowStatsByDefault = True	;True if you want to see the statsGUI by default, False if it should be hidden
Global $ForceProcessInventory = False ;DEBUG SETTING: Set true to test the inventory processing logic
Global $ForceOnlyOneRun = True ; Set true to test the bot with only one run
Global $StorageTabForTome = 3 ;Tab in the storage where the tomes will be stored (1..4)

; ==== Map IDs ====
Global Const $MAP_ID_BOREAL_STATION = 675
Global Const $MAP_ID_ICE_CLIFF_CHASMS = 499
Global Const $ITEM_ID_Chocolate_Bunny = 21812
Global Const $ATTRIBUTE_SOUL_REAPING = 6
Global Const $ATTRIBUTE_ENERGY_STORAGE = 12
Global Const $ATTRIBUTE_FAST_CASTING = 7

; ==== Bot global variables ====
Global $BotRunning = False, $BotInitialized = False
Global $LuckyPointsAtStart, $UnluckyPointsAtStart
Global $player_status, $player_status_list, $GWPID
Global Const $status[5][2] = [[4, 1], [0, "Offline"], [1, "Online"], [3, "Away"], [2, "Do not disturb"]]
Global $diff = 0, $StartingTime = 0, $TimeoutTime = 0, $TimeDifference = 0 ;time count variables
Global $OpenedChestAgentIDs[1]	;dirty fix for not using TargetNearestItem() (black list variable as previously opened chests were not targeted using TargetNearestItem(), now they are)
Global $storage_full = False
; <<<< End of Settings <<<<
#EndRegion Declarations

#Region MainLoop
BuildGui()
Do
	Sleep(500)
Until $BotInitialized

While True
	While $BotRunning
    If CountInventoryItem($MODEL_ID_LOCKPICK) = 0 Then ExitLoop
		GUICtrlSetData($LockpicksLabel, CountInventoryItem($MODEL_ID_LOCKPICK))

    If GUICtrlRead($LockpicksLabel) == 0 Then
			Logger("Out of Lockpicks!")
			$BotRunning = False
			GUICtrlSetData($Button, "Resume?")
			ExitLoop
		EndIf

		$OpenedChestAgentIDs[0] = ""

		If DoTheJob() Then
			GUICtrlSetData($stRuns, GUICtrlRead($stRuns) + 1)
			CheckInventory()
		EndIf
		ReDim $OpenedChestAgentIDs[1]
		If Not $BotRunning Then
			If GetMapLoading() == $INSTANCETYPE_EXPLORABLE Then ZoneMap($MAP_ID_BOREAL_STATION)
			Logger("Bot paused.")
			GUICtrlSetData($Button, "Resume?")
			GUICtrlSetState($Button, $GUI_ENABLE)
		Else
			Sleep(500)
		EndIf
	WEnd
WEnd
#EndRegion MainLoop

#Region GUI
;~ Description: Creates the GUI
Func BuildGui()
	Local $logged_chars = GetLoggedCharNames()
	Local $width = 170
	Local $height = 170
	Local $titlebar = 25	;default height of the title bar of a window

	;mainGUI
	Global Const $mainGui = GUICreate("Boreal Chest Runner", $width, $height)
	GUISetOnEvent($GUI_EVENT_CLOSE, "EventHandler")
	GUICtrlCreateLabel("Character Name:", 8, 2, 152, 15)
	Global Const $txtName = GUICtrlCreateCombo("", 8, 17, 150, 45)
	If ($logged_chars == "") Then
		GUICtrlSetState(-1, $GUI_DISABLE)
	Else
		GUICtrlSetData(-1, $logged_chars, StringSplit($logged_chars, "|", 2)[0])
	EndIf
	Global Const $gui_toggle_rendering = GUICtrlCreateCheckbox("Disable rendering", 8, 38)
	GUICtrlSetOnEvent(-1, "EventHandler")
	GUICtrlSetState(-1, $GUI_DISABLE)
	Global Const $gui_toggle_ontop = GUICtrlCreateCheckbox("GUI always on top", 8, 55)
	GUICtrlSetOnEvent(-1, "EventHandler")
	GUICtrlSetState(-1, $GUI_DISABLE)
	Global Const $gui_toggle_hardmode = GUICtrlCreateCheckbox("Hardmode", 8, 72)
	GUICtrlSetOnEvent(-1, "EventHandler")
	GUICtrlSetState(-1, $GUI_DISABLE)
	If $UseHardMode Then GUICtrlSetState(-1, $GUI_CHECKED)
	Global Const $gui_toggle_statsGUI = GUICtrlCreateCheckbox("Show stats", 80, 72)
	GUICtrlSetOnEvent(-1, "EventHandler")
	GUICtrlSetState(-1, $GUI_DISABLE)
	If $ShowStatsByDefault Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlCreateLabel("Lockpicks left:", 8, 91)
	Global Const $LockpicksLabel = GUICtrlCreateLabel("", 90, 91, 25, 15)
	GUICtrlCreateLabel("Time running:", 8, 103, 75, 15)
	Global Const $TimeRunningLabel = GUICtrlCreateLabel("", 90, 103, 60, 15)
	Global Const $gui_online_state = GUICtrlCreateCombo("Online Set-State", 9, 117, 150, 23, 0x3) ;0x3 = $CBS_DROPDOWNLIST = combo field can't be edited
	GUICtrlSetOnEvent(-1, "change_player_status")
	GUICtrlSetState(-1, $GUI_DISABLE)
	Global Const $Button = GUICtrlCreateButton("Load Character", 8, 139, 152, 23)
	GUICtrlSetOnEvent(-1, "EventHandler")
	GUISetState(@SW_SHOW, $mainGui)

	;statsGUI
	Global Const $statsGui = GUICreate("Stats", 100, 150 + $titlebar + 3 - 14, $width + 2, -$titlebar, BitOR($WS_SIZEBOX, $WS_SYSMENU), $WS_EX_MDICHILD, $mainGui)
	GUISetOnEvent($GUI_EVENT_CLOSE, "EventHandler")
	GUICtrlCreateLabel("Runs:", 8, 5)
	Global Const $stRuns = GUICtrlCreateLabel("0", 73, 5, 45, 15)
	GUICtrlCreateLabel("Chests:", 8, 20)
	Global Const $stChests = GUICtrlCreateLabel("0", 73, 20, 45, 15)
	GUICtrlCreateLabel("LP retained:", 8, 35)
	Global Const $stRetained = GUICtrlCreateLabel("0", 73, 35, 45, 15)
	GUICtrlCreateLabel("LP broken:", 8, 50)
	Global Const $stBroken = GUICtrlCreateLabel("0", 73, 50, 45, 15)
	GUICtrlCreateLabel("Δ Luck:", 8, 65)
	Global Const $stLuck = GUICtrlCreateLabel("0", 73, 65, 45, 15)
	GUICtrlCreateLabel("Δ Bad Luck:", 8, 80)
	Global Const $stBadLuck = GUICtrlCreateLabel("0", 73, 80, 45, 15)
	GUICtrlCreateLabel("", 8, 100, 105, 1, 0x10)	;$SS_ETCHEDHORZ == 0x10	in StaticConstants.au3 (= horizontal line)
	GUICtrlCreateLabel("Golds:", 8, 105)
	Global Const $stGolds = GUICtrlCreateLabel("0", 90, 105, 45, 15)
  GUICtrlCreateLabel("Elite Tomes:", 8, 120)
	Global Const $stTomesElite = GUICtrlCreateLabel("0", 90, 120, 45, 15)

	If $ShowStatsByDefault Then
		GUISetState(@SW_SHOW, $statsGui)
		GUICtrlSetState($txtName, $GUI_FOCUS)
	EndIf

	;console
	GUICreate("Info", 200, 250, 420, -1, -1, -1, $mainGui) ; will create a dialog box that when displayed is centered

	Global const $InfoPanel = GUICtrlCreateEdit("> Initialised Logger." & @CRLF, 5, 2, 195, 248, $ES_AUTOVSCROLL + $WS_VSCROLL + $ES_MULTILINE + $ES_READONLY)
	GUISetState(@SW_SHOW)
	GUISetOnEvent($GUI_EVENT_CLOSE, "EventHandler")

EndFunc   ;==>BuildGui

;~ Description: Handles the button presses
Func EventHandler()
	Switch @GUI_CtrlId
		Case $GUI_EVENT_CLOSE
			If @GUI_WinHandle == $mainGui Then
				If GUICtrlRead($gui_toggle_rendering) == $GUI_CHECKED Then
					WinSetState($GWPID, "", @SW_SHOW)
					EnableRendering()
					Sleep(100)
				EndIf
				Exit 0
			ElseIf @GUI_WinHandle == $statsGui Then
				GUISetState(@SW_HIDE, $statsGui)
				GUICtrlSetState($gui_toggle_statsGUI, $GUI_UNCHECKED)
			EndIf
		Case $Button
			If $BotRunning Then
				GUICtrlSetData($Button, "Bot will pause after run")
				GUICtrlSetState($Button, $GUI_DISABLE)
				$BotRunning = False
			ElseIf $BotInitialized Then
				GUICtrlSetData($Button, "Pause")
				$StartingTime = _NowCalc()
				$TimeoutTime = $diff
				$BotRunning = True
			Else
				Logger("Initializing ...")
				If Initialize(GUICtrlRead($txtName), True, True, False) Then
					Local $charname = GetCharname()
					GUICtrlSetData($txtName, $charname, $charname)
					GUICtrlSetData($Button, "Initializing...")
					GUICtrlSetState($Button, $GUI_DISABLE)
					GUICtrlSetState($txtName, $GUI_DISABLE)
					WinSetTitle($mainGui, "", "Boreal Station Chest Runner - " & $charname)
					If GetMapLoading() <> $INSTANCETYPE_OUTPOST Then TravelTo($MAP_ID_BOREAL_STATION)
					RndSleep(GetPing() + 100)
					For $i = 1 To $status[0][0]
						$player_status_list &= $status[$i][1]
						If $i <> $status[0][0] Then $player_status_list &= "|"
					Next
					GUICtrlSetData($gui_online_state, "")
					GUICtrlSetData($gui_online_state, $player_status_list, $status[$status[0][1]][1])
					GUICtrlSetState($gui_online_state, $GUI_ENABLE)
					GUICtrlSetState($gui_toggle_rendering, $GUI_ENABLE)
					GUICtrlSetState($gui_toggle_ontop, $GUI_ENABLE)
					GUICtrlSetState($gui_toggle_hardmode, $GUI_ENABLE)
					GUICtrlSetState($gui_toggle_statsGUI, $GUI_ENABLE)
					GUICtrlSetData($LockpicksLabel, CountInventoryItem($MODEL_ID_LOCKPICK))
					GUICtrlSetData($Button, "Start Bot")
					GUICtrlSetState($Button, $GUI_ENABLE)
					$LuckyPointsAtStart = GetLuckyTitle()
					$UnluckyPointsAtStart = GetUnluckyTitle()
					;$GWPID = $mGWHwnd
					$BotInitialized = True
					change_player_status()
					Logger("Bot Initialized.")
					Logger("Ready to start!")
				Else
					MsgBox(0, "Error", "Guild Wars it not running or character not found.")
					Exit 1
				EndIf
			EndIf
		Case $gui_toggle_rendering
			If GUICtrlRead($gui_toggle_rendering) == $GUI_CHECKED Then
				DisableRendering()
				WinSetState($GWPID, "", @SW_HIDE)
				ClearMemory()
			Else
				WinSetState($GWPID, "", @SW_SHOW)
				EnableRendering()
			EndIf
		Case $gui_toggle_ontop
			If GUICtrlRead($gui_toggle_ontop) == $GUI_CHECKED Then
				WinSetOnTop($mainGui, "", 1)
			ElseIf GUICtrlRead($gui_toggle_ontop) == $GUI_UNCHECKED Then
				WinSetOnTop($mainGui, "", 0)
			EndIf
		Case $gui_toggle_statsGUI
			If GUICtrlRead($gui_toggle_statsGUI) == $GUI_CHECKED Then
				GUISetState(@SW_SHOW, $statsGui)
			ElseIf GUICtrlRead($gui_toggle_statsGUI) == $GUI_UNCHECKED Then
				GUISetState(@SW_HIDE, $statsGui)
			EndIf
		Case $gui_toggle_hardmode
			If GUICtrlRead($gui_toggle_hardmode) == $GUI_CHECKED Then
				$UseHardMode = True
				If GetMapLoading() == $INSTANCETYPE_OUTPOST Then SwitchMode($DIFFICULTY_HARD)
			ElseIf GUICtrlRead($gui_toggle_hardmode) == $GUI_UNCHECKED Then
				$UseHardMode = False
				If GetMapLoading() == $INSTANCETYPE_OUTPOST Then SwitchMode($DIFFICULTY_NORMAL)
			EndIf
	EndSwitch
EndFunc   ;==>EventHandler
#EndRegion GUI

#Region ChestRun
Func DoTheJob()
	Local $tOutpostTimer = Timerinit()
	If GetMapID() <> $MAP_ID_BOREAL_STATION Then
	Logger("Traveling to Boreal")
	TravelTo($MAP_ID_BOREAL_STATION)
	WaitMapLoading()
	Sleep(800)
	Logger("End Sleep")
	EndIf
	Logger("In Boreal")
	If Not $BotRunning Then Return
	If $UseHardMode Then
		SwitchMode($DIFFICULTY_HARD)
	Else
		SwitchMode($DIFFICULTY_NORMAL)
	EndIf
	Logger("Starting Run #" & GUICtrlRead($stRuns) + 1)
	Logger("Exiting Outpost")
	UseChocBunny()
	MoveTo(5584, -27924)
	Move(5232, -27891)
	Logger("In Position")
    Moveto(3986, -27642)
	Sleep(1500)
	WaitMapLoading($MAP_ID_ICE_CLIFF_CHASMS) 
	Sleep(1850)
	Logger("Running")
	_Run(2728, -25294)
  _Run(2900, -22272)
  _Run(-1000, -19801)
  _Run(-2570, -17208)
  ;~ Check for the maximum of three chests.
  _Run(-4218, -15219)
	CheckForChest()
  _Run(-4218, -15219)
  CheckForChest()
  _Run(-4218, -15219)
  CheckForChest()
  PickUpLoot()
  PickUpLoot()
	Return True
EndFunc	;==>DoTheJob

Func _Run($aX, $aY, $aRandom = 75, $aReturnIfNoLockpicksAvaillabe = True)
	If GetIsDead(-2) Then Return
	If $aReturnIfNoLockpicksAvaillabe And GUICtrlRead($LockpicksLabel) == 0 Then Return

	Local $lBlocked = 0
	Local $lMe
	Local $lDestX = $aX + Random(-$aRandom, $aRandom)
	Local $lDestY = $aY + Random(-$aRandom, $aRandom)

	Move($lDestX, $lDestY, 0)

	Do
		Sleep(250)
		$lMe = GetAgentByID(-2)
		If GetEnergy($lMe) >= 5 And OffEffect($STAB) And IsRecharged($STAB) Then UseSkillEx($STAB)
		If GetEnergy($lMe) >= 8 And IsRecharged($ZEAL) And IsRecharged($PIOUS) Then UseSkillEx($ZEAL)
    If GetEnergy($lMe) >= 8 And IsRecharged($PIOUS) Then UseSkillEx($PIOUS)

    $lMe = GetAgentByID(-2)
		If DllStructGetData($lMe, 'MoveX') == 0 And DllStructGetData($lMe, 'MoveY') == 0 Then
			$lBlocked += 1
			$lDestX = $aX + Random(-$aRandom, $aRandom)
			$lDestY = $aY + Random(-$aRandom, $aRandom)
			Move($lDestX, $lDestY, 0)
		EndIf
		If DllStructGetData($lMe, 'HP') <= 0 Then ExitLoop
	Until ComputeDistance(DllStructGetData($lMe, 'X'), DllStructGetData($lMe, 'Y'), $lDestX, $lDestY) < 100 Or $lBlocked > 14
EndFunc   ;==>_Run

Func CheckForChest()
	Local $AgentArray, $lAgent, $lExtraType
	Local $ChestFound = False
	Local $lLockPicksBefore = GUICtrlRead($LockpicksLabel)
	If $lLockPicksBefore == 0 Then Return
	If GetIsDead(-2) Then Return

	$AgentArray = GetAgentArraySorted(0x200)	;0x200 = type: static
	For $i = 0 To UBound($AgentArray) - 1	;there might be multiple chests in range
		$lAgent = GetAgentByID($AgentArray[$i][0])
		$lExtraType = DllStructGetData($lAgent, 'ExtraType')
		If $lExtraType <> 4582 And $lExtraType <> 8141 Then ContinueLoop	;dirty fix: skip signposts that aren't chests (nm And hm chest)
		If _ArraySearch($OpenedChestAgentIDs, $AgentArray[$i][0]) == -1 Then
			If @error <> 6 Then ContinueLoop
			If $OpenedChestAgentIDs[0] = "" Then	;dirty fix: blacklist chests that were opened before
				$OpenedChestAgentIDs[0] = $AgentArray[$i][0]
			Else
				_ArrayAdd($OpenedChestAgentIDs, $AgentArray[$i][0])
			EndIf
			$ChestFound = True
			ExitLoop
		EndIf
	Next
	If Not $ChestFound Then Return
	Logger("Opening chest!")
	GoSignpost($lAgent)
	OpenChest()
	Sleep(GetPing() + 500)
	GUICtrlSetData($stChests, GUICtrlRead($stChests) + 1)
	$AgentArray = GetAgentArraySorted(0x400)	;0x400 = type: item
	ChangeTarget($AgentArray[0][0])	;in case you watch the bot running you can see what dropped immediately

	If CountInventoryItem($MODEL_ID_LOCKPICK) == $lLockPicksBefore Then
		GUICtrlSetData($stRetained, GUICtrlRead($stRetained) + 1)
		GUICtrlSetData($stLuck, GetLuckyTitle() - $LuckyPointsAtStart)
	Else
		GUICtrlSetData($stBroken, GUICtrlRead($stBroken) + 1)
		GUICtrlSetData($stBadLuck, GetUnluckyTitle() - $UnluckyPointsAtStart)
		GUICtrlSetData($LockpicksLabel, $lLockPicksBefore - 1)
	EndIf
	PickUpLoot()
EndFunc   ;==>CheckForChest

Func GetAgentArraySorted($lAgentType)	;returns a 2-dimensional array([agentID, [distance]) sorted by distance
	Local $lDistance
	Local $lAgentArray = GetAgentArray($lAgentType)
	Local $lReturnArray[1][2]
	Local $lMe = GetAgentByID(-2)
	Local $AgentID

	For $i = 1 To $lAgentArray[0]
		$lDistance = (DllStructGetData($lMe, 'X') - DllStructGetData($lAgentArray[$i], 'X')) ^ 2 + (DllStructGetData($lMe, 'Y') - DllStructGetData($lAgentArray[$i], 'Y')) ^ 2
		$AgentID = DllStructGetData($lAgentArray[$i], 'ID')
		ReDim $lReturnArray[$i][2]
		$lReturnArray[$i - 1][0] = $AgentID
		$lReturnArray[$i - 1][1] = Sqrt($lDistance)
	Next
	_ArraySort($lReturnArray, 0, 0, 0, 1)
	Return $lReturnArray
EndFunc   ;==>GetAgentArraySorted

Func OffEffect($SkillNumber)
	Local $skillslotid = getskillbarskillid($skillnumber)
	Local $effectstruct = geteffect($skillslotid, 0)
	Local $effect = DllStructGetData($effectstruct, "skillid")
	If $effect == 0 Then Return True
	Return False
EndFunc   ;==>OffEffect

Func PickUpLoot($lTimeOut = 10000)
	If GetIsDead(-2) Then Return
	Local $lAgent, $lItem, $lDeadlock, $LabelID, $lMe
	For $i = 1 To GetMaxAgents()
		$lAgent = GetAgentByID($i)
		If Not GetIsMovable($lAgent) Then ContinueLoop
		$lItem = GetItemByAgentID($i)
		If CanPickUp($lItem) Then
			$LabelID = @extended
      $lMe = GetAgentByID(-2)
      If GetEnergy($lMe) >= 5 And OffEffect($STAB) And IsRecharged($STAB) Then UseSkillEx($STAB)
      If GetEnergy($lMe) >= 8 And IsRecharged($ZEAL) And IsRecharged($PIOUS) Then UseSkillEx($ZEAL)
      If GetEnergy($lMe) >= 8 And IsRecharged($PIOUS) Then UseSkillEx($PIOUS)
			_Run(DllStructGetData($lAgent, 'X'), DllStructGetData($lAgent, 'Y'), 75, False)
			PickUpItem($lItem)
			$lDeadlock = TimerInit()
			While GetAgentExists($i)
				sleep(50)
				If GetIsDead(-2) Then Return
				If TimerDiff($lDeadlock) > $lTimeOut Then ExitLoop
			WEnd
			If Not GetAgentExists($i) Then GUICtrlSetData($LabelID, GUICtrlRead($LabelID) + 1)
		EndIf
	Next
EndFunc   ;==>PickUpLoot

Func CanPickUp($aItem)
	Local $lModelID = DllStructGetData($aItem, 'ModelID')

	If $lModelID == 2509 Or $lModelID == 2474 Then
		Return True ; objets personnalisés à ramasser
	EndIf

	If $lModelID >= $MODEL_ID_TOME_E_SIN And $lModelID <= $MODEL_ID_TOME_E_PARA Then
		SetExtended($stTomesElite)
		Return $PickUpEliteTomes
	ElseIf $lModelID >= $MODEL_ID_TOME_R_SIN And $lModelID <= $MODEL_ID_TOME_R_PARA Then
		Return $PickUpNormalTomes
	EndIf

	If CountFreeSlots() <= 0 Then Return False

	Local $lRarity = GetRarity($aItem)
	If $lRarity == $RARITY_GOLD Then
		SetExtended($stGolds)
		Return True
	EndIf

	Return False
EndFunc	;==>CanPickUp

Func Sell($BAGINDEX)
	Local $AITEM
	Local $BAG = GETBAG($BAGINDEX)
	Local $NUMOFSLOTS = DllStructGetData($BAG, "slots")
	For $I = 1 To $NUMOFSLOTS
		Logger("Selling item: " & $BAGINDEX & ", " & $I)
		$AITEM = GETITEMBYSLOT($BAGINDEX, $I)
		If DllStructGetData($AITEM, "ID") = 0 Then ContinueLoop
		If CANSELL($AITEM) Then
		;==>Logger("Would sell item: ModelID=" & DllStructGetData($AITEM, "ModelID") & ", Rarity=" & GetRarity($AITEM))
			SELLITEM($AITEM)
		EndIf
		Sleep(GetPing()+250)
	Next
EndFunc

#Region Inventory
Func CheckInventory()
	Local $aItem, $RuneOrInsignia, $Timer
	If CountFreeSlots($UseBags) >= 5 And Not $ForceProcessInventory Then Return
	If GetMapID() <> $MAP_ID_BOREAL_STATION Then TravelTo($MAP_ID_BOREAL_STATION)
	Sleep(3000)
	UseChocBunny()
	Logger("Cleaning Inventory")
	StoreTomes()
	Logger("Tome OK")
	If GetGoldCharacter() >= 50000 Then DepositGold(50000)
	Logger("Gold OK")
	If CountFreeSlots($UseBags) >= 5 And Not $ForceProcessInventory Then Return
	If $ForceOnlyOneRun Then 
		Logger("Forcing only one full inventory, not cleaning inventory.") 
		Exit
	EndIf
	GoToNPC(GetNearestNPCToCoords(7319, -24874)); Borvorel[Merchant]

  	Logger("Targeted Merchant")
	For $lBag = 1 To $UseBags
		If Not FindIDKit() Then
			BuySuperiorIDKit()
			$Timer = TimerInit()
			Do
				Sleep(250)
			Until FindIDKit() Or TimerDiff($Timer) > 5000
		EndIf
    Logger("Identifying")
	IdentBag(1)
	IdentBag(2)
	IdentBag(3)
	IdentBag(4)
	
	;StoreMods()
	;StoreWeapons()

	Logger("Selling")
	Sell(1)
	Sell(2)
	Sell(3)
	Sell(4)
	
	StoreGoldsEx()
	Next
EndFunc	;==>CheckInventory

Func CanStoreGoldsEx($aItem)
	Local $m = DllStructGetData($aItem, "ModelID")
	Local $r = GetRarity($aItem)
	Switch $r
		Case $Rarity_Gold
			If $m = 22280 Then ; FoW Scroll
				Return False
			Else
				Return True
			EndIf
	EndSwitch
EndFunc   ;==>CanStoreGolds

Func CanStoreTomes($aItem)
	Local $m = DllStructGetData($aItem, "ModelID")
	If $m >= $MODEL_ID_TOME_R_SIN And $m <= $MODEL_ID_TOME_R_PARA Then
		Logger("Normal Tome found: " & $m)
		Return True
	EndIf
	If $m >= $MODEL_ID_TOME_E_SIN And $m <= $MODEL_ID_TOME_E_PARA Then
		Logger("Elite Tome found: " & $m)
		Return True
	EndIf
	Return False
EndFunc ;==>CanStoreTomes

Func StoreGoldsEx()
	Logger("Storing Golds")
	Local $aItem, $lItem, $m, $Q, $r, $lbag, $Slot, $Full, $NSlot
	For $i = 1 To 4
		$lbag = GetBag($i)
		For $j = 1 To DllStructGetData($lbag, 'Slots')
			$aItem = GetItemBySlot($lbag, $j)
			If DllStructGetData($aItem, "ID") = 0 Then ContinueLoop
			$m = DllStructGetData($aItem, "ModelID")
			$r = GetRarity($lItem)
			If CanStoreGoldsEx($aItem) Then
				Do
					For $Bag = 8 To 12
						$Slot = FindEmptySlotEx($Bag)
						$Slot = @extended
						If $Slot <> 0 Then
							$Full = False
							$NSlot = $Slot
							ExitLoop 2
						Else
							$Full = True
						EndIf
						Sleep(300)
					Next
				Until $Full = True
				If $Full = False Then
					MoveItem($aItem, $Bag, $NSlot)
					Sleep(300)
				EndIf
			EndIf
		Next
	Next
EndFunc   ;==>StoreGolds


Func StoreTomes()
	Local $aItem, $lItem, $m, $SlotItem, $lbag, $aSlot, $Full, $NSlot, $Bag, $sm
	For $i = 1 To 4
		$lbag = GetBag($i)
		For $j = 1 To DllStructGetData($lbag, 'Slots')
			$aItem = GetItemBySlot($lbag, $j)
			If DllStructGetData($aItem, "ID") = 0 Then ContinueLoop
			$m = DllStructGetData($aItem, "ModelID")
			If CanStoreTomes($aItem) Then
				$Bag = $StorageTabForTome + 7 ; +7 here is the offset for the storage bags
				For $aSlot = 1 To DllStructGetData(GetBag($Bag), "Slots")
					$SlotItem = GetItemBySlot($Bag, $aSlot)
					$sm = DllStructGetData($SlotItem, "ModelID")
					If $m = $sm Then 
						$Full = False
						$NSlot = $aSlot
						ExitLoop
					Else
						$Full = True
					EndIf
					Sleep(300)
				Next
				If $Full = False Then
					MoveItem($aItem, $Bag, $NSlot)
					Sleep(300)
				EndIf
			EndIf
		Next
	Next
EndFunc   ;==>StoreTomes


Func FindEmptySlotEx($BagIndex)
	Local $LItemINFO, $aSlot
	For $aSlot = 1 To DllStructGetData(GetBag($BagIndex), "Slots")
		Sleep(40)
		$LItemINFO = GetItemBySlot($BagIndex, $aSlot)
		If DllStructGetData($LItemINFO, "ID") = 0 Then
			SetExtended($aSlot)
			ExitLoop
		EndIf
	Next
	Return 0
EndFunc   ;==>FindEmptySlot

Func IdentBag($bagIndex, $aWhites = False, $aGolds = True)
	Local $lItem
	Local $lBag = GetBag($bagIndex)
	For $i = 1 To DllStructGetData($lBag, 'slots')
		$lItem = GetItemBySlot($bagIndex, $i)
		If DllStructGetData($lItem, 'ID') = 0 Then ContinueLoop
		If GetRarity($lItem) = $rarity_white And $aWhites = False Then ContinueLoop
		If GetRarity($lItem) = $rarity_gold And $aGolds = False Then ContinueLoop
		If GetIsIDed($lItem) Then ContinueLoop
		If FindIDKit() = 0 Then
			If GetMapID() == $MAP_ID_BOREAL_STATION Then
				If GetGoldCharacter() < 1000 AND GetGoldStorage() > 1000 Then
					WithdrawGold(1000)
					RndSleep(500)
				EndIf			
				BuySuperiorIDKit2()
			Else
				Return False
			EndIf
		EndIf
		IdentifyItem2($lItem)
		PingSleep(50)
	Next
EndFunc ;==>IdentBag



Func CanSell($aItem)
	Local $Rarity = GetRarity($aItem)
	Local $GetProfUpgrade = GetProfUpgrade($aItem)
	Local $IsEotN = IsEotN($aItem)
	Local $lType = DllStructGetData($aItem, 'Type')
	Local $lModelID = MemoryRead(GetItemPtr($aItem) + 44, "long")
	Local $LRARITY = GetRarity($aItem)
	Local $IsAny = IsAny($aItem) ;==>Anni weapons

	If GetProfUpgrade($aItem) Then
		Return False
	EndIf
	If IsEotN($aItem) Then
		Return False
	EndIf
	If IsAny($aItem) Then
		Return False
	EndIf

	; Ne pas vendre les ModelID spécifiques
	If $lModelID == 2473 Or $lModelID == 2474 Then
		Return False
	EndIf

	Switch $lModelID
		Case 5899
			Return True
	EndSwitch

	If $LRARITY == $RARITY_Gold Then
		Return True
	EndIf

	If $LRARITY == $RARITY_Purple Then
		Return True
	EndIf

	;~ Leaving Blues and Whites as false for now. Going to make it salvage them at some point in the future. It does not currently pick up whites or blues
	If $LRARITY == $RARITY_Blue Then
		Return False
	EndIf
	If $LRARITY == $RARITY_White Then
		Return False
	EndIf
EndFunc	;==>CanSell



Func UseChocBunny()
  Local $item = GetItemByModelID($ITEM_ID_Chocolate_Bunny)
  If DllStructGetData($item, 'Bag') <> 0 Then
    UseItem($item)
    Sleep(100)
    Return
  EndIf
EndFunc

Func CountFreeSlots($NumOfBags = 4)
	Local $FreeSlots, $Slots
	For $Bag = 1 To $NumOfBags
		$Slots += DllStructGetData(GetBag($Bag), 'Slots')
		$Slots -= DllStructGetData(GetBag($Bag), 'ItemsCount')
	Next

	Return $Slots
 EndFunc   ;==>CountFreeSlots

Func CountStorageSlots($NumOfBags = 11)
	Local $FreeSlots, $Slots

	For $Bag = 8 To $NumOfBags
		$Slots += DllStructGetData(GetBag($Bag), 'Slots')
		$Slots -= DllStructGetData(GetBag($Bag), 'ItemsCount')
	Next

	Return $Slots
 EndFunc   ;==>CountFreeSlots
#EndRegion Inventory

#Region Misc
Func Logger($text)
	Local $timestamp = "[" & @HOUR & ":" & @MIN & "] "
	GUICtrlSetData($InfoPanel, $timestamp & $text & @CRLF, 1)
EndFunc

Func CalculateTimeDifference() ;calculates, how long the bot is running
	$diff = _DateDiff('s', $StartingTime, _NowCalc()) + $TimeoutTime
	Select
		Case $diff < 60
			$TimeDifference = StringFormat('%02u', $diff) & ' s'
		Case $diff < 60 * 60
			$TimeDifference = StringFormat('%02u', Floor($diff / 60)) & ':' & _
					StringFormat('%02u', Mod($diff, 60)) & ' min'
		Case $diff < 60 * 60 * 24
			$TimeDifference = StringFormat('%02u', Floor($diff / 3600)) & ':' & _
					StringFormat('%02u', Floor(Mod($diff, 3600) / 60)) & ':' & _
					StringFormat('%02u', Mod(Mod($diff, 3600), 60)) & ' h'
		Case Else
			$TimeDifference = Floor($diff / 86400) & ' d / ' & _
					StringFormat('%02u', Floor(Mod($diff, 86400) / 3600)) & ':' & _
					StringFormat('%02u', Floor(Mod(Mod($diff, 86400), 3600) / 60)) & ':' & _
					StringFormat('%02u', Mod(Mod(Mod($diff, 86400), 3600), 60)) & ' h'
	EndSelect
	Return True
EndFunc   ;==>CalculateTimeDifference

Func GetPlayerStatusText() ;reads the online status of the account and returns it as string
	$player_status = GetPlayerStatus()
	Local $status_as_text
	For $i = 1 To $status[0][0]
		If ($status[$i][0] == $player_status) Then
			$status_as_text = $status[$i][1]
			ExitLoop 1
		EndIf
	Next
	Return $status_as_text
EndFunc   ;==>GetPlayerStatusText

Func change_player_status() ;changes the online state of the account to what is set
	Local $new_player_status = GUICtrlRead($gui_online_state)
	Local $value_is_ok = False
	For $i = 1 To $status[0][0]
		If ($status[$i][1] == $new_player_status) Then
			$value_is_ok = Not $value_is_ok
			ExitLoop 1
		EndIf
	Next
	If Not $value_is_ok Then Return False
	If Not SetPlayerStatus($status[$i][0]) Then Return False
	$player_status = $status[$i][1]
	Return True
EndFunc   ;==>change_player_status
#EndRegion Misc

 Func PingSleep($msExtra = 0)
	Local $ping
	$ping = GetPing()
	Sleep($msExtra + $ping)
 EndFunc

 ; Returns number of that specific item
Func CountInventoryItem($ItemID)
	Local $count = 0
	Local $lItemInfo
	For $i = 1 To 4
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots')
			$lItemInfo = GetItemBySlot($i, $j)
			If DllStructGetData($lItemInfo, 'ModelID') = $ItemID Then $count += DllStructGetData($lItemInfo, 'quantity')
		Next
	Next
	Return $count
 EndFunc   ;==>CountInventoryItem

Func GetItemPtr($aItem)
	If IsPtr($aItem) Then Return $aItem
	Local $lOffset[5] = [0, 0x18, 0x40, 0xB8, 0x4 * ItemID($aItem)]
	Local $lItemStructAddress = MemoryReadPtr($mBasePointer, $lOffset, "ptr")
	Return $lItemStructAddress[1]
EndFunc   ;==>GetItemPtr
