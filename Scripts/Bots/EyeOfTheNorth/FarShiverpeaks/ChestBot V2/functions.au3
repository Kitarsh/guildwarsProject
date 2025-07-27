#cs ----------------------------------------------------------------------------
	Collection of different usefull functions.
#ce ----------------------------------------------------------------------------
#include-once
#include <Array.au3>
#include "GWA2_Headers.au3"
#include "GWA2.au3"
#include "constants.au3"

; Sells all the unneeded Mats to Merchant
; Make sure *you are standing at a Merchant!!!*
Func SellJunk()
	Local $lItem, $lQuantity, $lModelID
	
	For $i = 1 To 4
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots')
			$lItem = GetItemBySlot($i, $j)
			If DllStructGetData($lItem, 'ID') = 0 Then ContinueLoop
			$lModelID = DllStructGetData($lItem, 'ModelID')
			$lQuantity = DllStructGetData($lItem, 'quantity')
			
			Switch $lModelID
				Case $model_id_shing_jea_key
					ContinueCase
				Case $model_id_wood_plank, $model_id_chitin_fragment
					ContinueCase
				Case $model_id_bolt_of_cloth, $model_id_tanned_hide_square
					SellItem($lItem, $lQuantity)
					PingSleep(500)
					ContinueLoop
			EndSwitch
		Next
	Next
EndFunc ;==>SellJunk

; Buys the cheapest Salvage Kit, use only in Embark Beach
Func BuySalvageKit2Embark()
	BuyItem(3, 1, 100)
	RndSleep(1000)
EndFunc

; Buys the cheapest Salvage Kit
Func BuySalvageKit2()
	BuyItem(2, 1, 100)
	RndSleep(1000)
EndFunc

; Buys Superior ID kit.
Func BuySuperiorIDKit2()
	BuyItem(6, 1, 500)
	RndSleep(1000)
EndFunc

; Buys Superior ID kit, use only in Embark Beach
Func BuySuperiorIDKit2Embark()
	BuyItem(7, 1, 500)
	RndSleep(1000)
EndFunc

Func FindSuperiorIDKit()
	Local $lItem
	Local $lKit = 0
	Local $lUses = 101
	For $i = 1 To 4
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots')
			$lItem = GetItemBySlot($i, $j)
			Switch DllStructGetData($lItem, 'ModelID')
				Case $model_id_superior_identification_kit
					If DllStructGetData($lItem, 'Value') / 2.5 < $lUses Then
						$lKit = DllStructGetData($lItem, 'ID')
						$lUses = DllStructGetData($lItem, 'Value') / 2.5
					EndIf
				Case Else
					ContinueLoop
			EndSwitch
		Next
	Next
	Return $lKit
EndFunc   ;==>FindSuperiorIDKit

Func IdentifyItem2($aItem)
	If GetIsIDed($aItem) Then Return
	
	Local $lItemID
	If IsDllStruct($aItem) = 0 Then
		$lItemID = $aItem
	Else
		$lItemID = DllStructGetData($aItem, 'ID')
	EndIf

	Local $lIDKit = FindSuperiorIDKit()
	If $lIDKit == 0 Then Return

	SendPacket(0xC, $HEADER_ITEM_IDENTIFY, $lIDKit, $lItemID)

	Local $lDeadlock = TimerInit()
	Do
		Sleep(20)
	Until GetIsIDed($lItemID) Or TimerDiff($lDeadlock) > 5000
	If Not GetIsIDed($lItemID) Then IdentifyItem2($aItem)
EndFunc   ;==>IdentifyItem

; Salvages an Item with a cheap Salvage Kit
Func StartSalvage2($aItem)
	Local $lOffset[4] = [0, 0x18, 0x2C, 0x690]
	Local $lSalvageSessionID = MemoryReadPtr($mBasePointer, $lOffset)

	If IsDllStruct($aItem) == 0 Then
		Local $lItemID = $aItem
	Else
		Local $lItemID = DllStructGetData($aItem, 'ID')
	EndIf

	Local $lSalvageKit = FindSalvageKit2() ; only this is different
	If $lSalvageKit == 0 Then Return

	DllStructSetData($mSalvage, 2, $lItemID)
	DllStructSetData($mSalvage, 3, $lSalvageKit)
	DllStructSetData($mSalvage, 4, $lSalvageSessionID[1])

	Enqueue($mSalvagePtr, 16)
EndFunc   ;==>StartSalvage

; Return Item ID of a cheap Salvage Kit or 0
Func FindSalvageKit2()
	Local $lItem
	Local $lKit = 0
	Local $lUses = 101
	For $i = 1 To 4
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots')
			$lItem = GetItemBySlot($i, $j)
			Switch DllStructGetData($lItem, 'ModelID')
			    Case $model_id_salvage_kit
					If DllStructGetData($lItem, 'Value') / 2 < $lUses Then
						$lKit = DllStructGetData($lItem, 'ID')
						$lUses = DllStructGetData($lItem, 'Value') / 2
					EndIf
				Case Else
					ContinueLoop
			EndSwitch
		Next
	Next
	Return $lKit
EndFunc   ;==>FindSalvageKit

;Drops all Items of given ModelID to ground, if in explorable
Func DropAllByModelID($aModelID = 0)
	Local $lItem = 0
	For $i = 1 To 4
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots')
			$lItem = GetItemBySlot($i, $j)
			If DllStructGetData($lItem, 'ID') = 0 Then ContinueLoop
			If DllStructGetData($lItem, 'ModelID') = $aModelID Then
				DropItem($lItem, DllStructGetData($lItem, 'quantity'))
				Sleep(250)
			EndIf
		Next
	Next
EndFunc

;Drops all Items of given Type to ground, if in explorable
Func DropAllByType($aType = 1000)
	If GetMapLoading() <> $instancetype_explorable Then Return False
	
	Local $lItem = 0
	For $i = 1 To 4
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots')
			$lItem = GetItemBySlot($i, $j)
			If DllStructGetData($lItem, 'ID') = 0 Then ContinueLoop
			If DllStructGetData($lItem, 'Type') = $aType Then
				DropItem($lItem, DllStructGetData($lItem, 'quantity'))
				Sleep(250)
			EndIf
		Next
	Next
EndFunc ;==>DropAllByType

;Drops all Items to ground, if in explorable
Func DropAll()
	Local $lItem = 0
	For $i = 1 To 4
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots')
			$lItem = GetItemBySlot($i, $j)
			If DllStructGetData($lItem, 'ID') <> 0 Then
				DropItem($lItem, DllStructGetData($lItem, 'quantity'))
				Sleep(250)
			EndIf
		Next
	Next
EndFunc

; Return number of free slots in inventory

; Return number of free slots in storage
Func CountFreeSlotsStorage()
	Local $lSlots
	Local $lBag

	For $i = 8 to 12
		$lBag = GetBag($i)
		$lSlots += DllStructGetData($lBag, 'Slots')
		$lSlots -= DllStructGetData($lBag, 'ItemsCount')
	Next
	Return $lSlots
EndFunc ;==>CountFreeSlotsStorage

Func IsEventItem($aModelID)
	; *******************************************************************************************
	; Pick up EVENT ITEMS, put semicolon(;) infront of the line, if you DON'T want do pick it up
	; *******************************************************************************************	
	
	; Canthan New Year
	If $aModelID = $model_id_lunar_token Then Return True
	
	; Lucky Treats Week
	If $aModelID = $model_id_four_leaf_clover Then Return True
	If $aModelID = $model_id_shamrock_ale Then Return True
	
	; Sweet Treats Week
	If $aModelID = $model_id_golden_egg Then Return True
	If $aModelID = $model_id_chocolate_bunny Then Return True
	
	; === Anniversary Celebration ===
	If $aModelID = $model_id_cupcake Then Return True
	If $aModelID = $model_id_honeycomb Then Return True
	If $aModelID = $model_id_sugary_blue_drink Then Return True
	; Alcohol
	If $aModelID = $model_id_hard_apple_cider Then Return True
	If $aModelID = $model_id_hunters_ale Then Return True
	If $aModelID = $model_id_krytan_brandy Then Return True
	; Party Points
	If $aModelID = $model_id_champagne_popper Then Return True
	If $aModelID = $model_id_bottle_rocket Then Return True
	If $aModelID = $model_id_sparkler Then Return True
	
	; Dragon Festival
	If $aModelID = $model_id_victory_token Then Return True ; also anniversary
	
	; Wintersday in July
	;	-->see Wintersday
	
	; Wayfarer's Reverie
	If $aModelID = $model_id_wayfarers_mark Then Return True ; this ID is WRONG in constants.au3
	
	; Pirate Week
	If $aModelID = $model_id_grog Then Return True
	
	; Halloween
	If $aModelID = $model_id_tot_bag Then Return True
	
	; Special Treats Week
	If $aModelID = $model_id_pumpkin_pie Then Return True ; + Hard Apple Cider, see above
	
	; Wintersday
	If $aModelID = $model_id_candy_cane_shard Then Return True
	If $aModelID = $model_id_eggnog Then Return True
	If $aModelID = $model_id_fruitcake Then Return True
	If $aModelID = $model_id_snowman_summoner Then Return True
	If $aModelID = $model_id_frosty_tonic Then Return True
	If $aModelID = $model_id_mischievous_tonic Then Return True
	
	Return False
EndFunc ;==>IsEventItem

; Pops a City Speedboost
Func MaintainCitySpeed()
	If GetIsEnchanted(-2) Then Return 1
	Local $lItem = 0
	For $i = 1 To 4
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots')
			$lItem = GetItemBySlot($i, $j)
			If CheckIsCitySpeed(DllStructGetData($lItem, 'ModelID')) Then
				UseItem($lItem)
				Return 1
			EndIf
		Next
	Next
	
	For $i = 8 To 12
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots')
			$lItem = GetItemBySlot($i, $j)
			If CheckIsCitySpeed(DllStructGetData($lItem, 'ModelID')) Then
				UseItem($lItem)
				Return 1
			EndIf
		Next
	Next
	Return 0
EndFunc ;==>MaintainCitySpeed

Func CheckIsCitySpeed($aModelID)
	Switch $aModelID
		Case $model_id_sugary_blue_drink
			Return True
		Case $model_id_chocolate_bunny
			Return True
		Case $model_id_fruitcake
			Return True
		Case $model_id_jar_of_honey
			Return True
		Case $model_id_creme_brulee
			Return True
		Case Else
			Return False
	EndSwitch
	Return False
EndFunc ;==>CheckIsCitySpeed

; Finds and Uses any Alcohol that is in inventory, Return 1 if successful and Return 0 if no alc is found
Func UseAlc()
	Local $lItem = 0
	For $i = 1 To 4
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots')
			$lItem = GetItemBySlot($i, $j)
			If CheckIsAlc(DllStructGetData($lItem, 'ModelID')) Then
				UseItem($lItem)
				Return 1
			EndIf
		Next
	Next
	Return 0
EndFunc ;==>UseAlc

Func CheckIsAlc($aModelID)
	Switch $aModelID
		Case $model_id_hard_apple_cider
			Return True
		Case $model_id_witchs_brew
			Return True
		Case $model_id_vial_of_absinthe
			Return True
		Case $model_id_hunters_ale
			Return True
		Case $model_id_shamrock_ale
			Return True
		Case $model_id_eggnog
			Return True
		Case $model_id_keg_of_aged_hunters_ale ;3min ALc starts here
			Return True
		Case $model_id_flask_of_firewater
			Return True
		Case $model_id_aged_hunters_ale
			Return True
		Case $model_id_grog
			Return True
		Case $model_id_krytan_brandy
			Return True
		Case $model_id_spiked_eggnog
			Return True
		Case Else
			Return False
	EndSwitch
	Return False
EndFunc ;==>CheckIsAlc

Func IsBlackDye($aModelID, $aExtraID)
	If $aModelID = $model_id_dye Then
		Switch $aExtraID
			Case $item_extraid_black_dye, $item_extraid_white_dye
				Return True
			Case Else
				Return False
		EndSwitch
	Else
		Return False
	EndIf
	Return False
EndFunc ;==>IsBlackDye

Func IsEliteOrNormalTome($aModelID)
	If $aModelID > 21785 And $aModelID < 21806 Then Return True
	Return False
EndFunc ;==>IsEliteOrNormalTome

;Stores all Items of given Type
Func StoreAllByType($aType = 1000)
	If GetMapLoading() <> $instancetype_outpost Then Return False
	Local $lItem = 0
	For $i = 1 To 4
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots')
			$lItem = GetItemBySlot($i, $j)
			If DllStructGetData($lItem, 'ID') = 0 Then ContinueLoop
			If DllStructGetData($lItem, 'Type') = $aType Then
				MoveItemToChest($lItem)
				Sleep(250)
			EndIf
		Next
	Next
EndFunc ;==>DropAllByType

; Devault: Looks for free Slot and puts Item there
; If $aStackItem = True, it will try to stack the same Items together
Func MoveItemToChest($aItem, $aStackItem = False)
	Local $lItem = 0, $lQuantity = 0, $lModelID = 0, $lMoveItem = False
	For $i = 8 To 12	; Find empty Chest Slot
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots') 
			$lItem = GetItemBySlot($i, $j)
			$lQuantity = DllStructGetData($lItem, 'quantity')
			$lModelID = DllStructGetData($lItem, 'ModelID')
			If DllStructGetData($lItem, "ID") = 0 Then
				$lMoveItem = True
				ExitLoop 2
			EndIf
			If $aStackItem = True And $lModelID = DllStructGetData($aItem, 'ModelID') Then
				If ($lQuantity + DllStructGetData($aItem, 'quantity')) <= 250 Then
					$lMoveItem = True
					ExitLoop 2
				EndIf
			EndIf
		Next
	Next
	
	If $lMoveItem = False Then Return False
	
	MoveItem($aItem, $i, $j)
	PingSleep(250)
	Return True
EndFunc ;==>MoveItemToChest

Func MoveItemToInventory($aItem)
	Local $lItem = 0
	For $i = 1 To 4	; Find empty Inventory Slot
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots') 
			$lItem = GetItemBySlot($i, $j)
			If DllStructGetData($lItem, "ID") = 0 Then ExitLoop 2
		Next
	Next
	
	If DllStructGetData($lItem, "ID") <> 0 Then Return False
	
	MoveItem($aItem, $i, $j)
	PingSleep(250)
	Return True
EndFunc

Func UseItemByModelID($aModelID)
	Local $lItem = GetItemInInventory($aModelID)
	If $lItem = 0 Then Return False
	
	UseItem($lItem)
	PingSleep(100)
	Return True
EndFunc

; Returns the first Item by ModelID found in Inventory; If no Item is found Returns Zero
Func GetItemInInventory($aModelID)
	Local $lItem = 0
	For $i = 1 To 4
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots')
			$lItem = GetItemBySlot($i, $j)
			If DllStructGetData($lItem, 'ModelID') = $aModelID Then Return $lItem
		Next
	Next
	Return 0
EndFunc ;==> GetItemInInventory

; Returns the first Item by ModelID found in Storage; If no Item is found Returns Zero
Func GetItemInChest($aModelID)
	Local $lItem = 0
	For $i = 8 To 12
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots')
			$lItem = GetItemBySlot($i, $j)
			If DllStructGetData($lItem, 'ModelID') = $aModelID Then Return $lItem
		Next
	Next
	Return 0
EndFunc ;==> GetItemInChest

; Return the amount of an Item in Inventory by ModelID
Func GetItemQuantityInventory($aModelID)
	Local $lItem = 0
	Local $lQuantity = 0
	For $i = 1 To 4
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots')
			$lItem = GetItemBySlot($i, $j)
			If DllStructGetData($lItem, 'ModelID') = $aModelID Then
				$lQuantity += DllStructGetData($lItem, 'quantity')
			EndIf
		Next
	Next
	Return $lQuantity
EndFunc ;==>GetItemQuantityInventory

; Return the amount of an Item in Chest by ModelID
Func GetItemQuantityChest($aModelID)
	Local $lItem = 0
	Local $lQuantity = 0
	For $i = 8 To 12
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots')
			$lItem = GetItemBySlot($i, $j)
			If DllStructGetData($lItem, 'ModelID') = $aModelID Then
				$lQuantity += DllStructGetData($lItem, 'quantity')
			EndIf
		Next
	Next
	Return $lQuantity
EndFunc ;==>GetItemQuantityChest

; Returns the amount of an Item by ModelID
Func GetItemQuantity($aModelID)
	Return GetItemQuantityInventory($aModelID) + GetItemQuantityChest($aModelID)
EndFunc ;==> GetItemQuantity

; Return the amount of Alcohol in Inventory
Func GetAlcQuantityInventory()
	Local $lItem = 0
	Local $lQuantity = 0
	For $i = 1 To 4
		For $j = 1 To DllStructGetData(GetBag($i), 'Slots')
			$lItem = GetItemBySlot($i, $j)
			If CheckIsAlc(DllStructGetData($lItem, 'ModelID')) Then
				$lQuantity += DllStructGetData($lItem, 'quantity')
			EndIf
		Next
	Next
	Return $lQuantity
EndFunc ;==>GetAlcQuantityInventory

; aEffect = Effect struct or SkillID
; maximum effect duration from time of casting in milliseconds
; if you dont have the effect duration==0
Func GetEffectTimeDuration($aEffect)
	If Not IsDllStruct($aEffect) Then $aEffect = GetEffect($aEffect)
	If IsArray($aEffect) Then Return 0
	Return DllStructGetData($aEffect, 'Duration') * 1000
EndFunc ;==>GetEffectTimeDuration

Func ChangeWeaponSetEx($aWeaponSlot = 0)
	Local $lUseControl = False
	If $lUseControl = True Then
		Switch $aWeaponSlot
			Case 1
				ControlSend(GetWindowHandle(), "", "", "{F1}")
				;Sleep(750)
			Case 2
				ControlSend(GetWindowHandle(), "", "", "{F2}")
				;Sleep(750)
			Case 3
				ControlSend(GetWindowHandle(), "", "", "{F3}")
				;Sleep(750)
			Case 4
				ControlSend(GetWindowHandle(), "", "", "{F4}")
				;Sleep(750)
			Case Else
				Return 0
		EndSwitch
	Else
		ChangeWeaponSet($aWeaponSlot)
	EndIf
	Sleep(750)
	Return 1
EndFunc ;==>ChangeWeaponSetEx

Func TargetNearestEnemyEx()
	Local $lUseControl = False
	If $lUseControl = True Then
		ControlSend(GetWindowHandle(), "", "", "{C}")
	Else
		TargetNearestEnemy()
	EndIf		
EndFunc ;==>TargetNearestEnemyEx

;~ Description: Agents X Location
Func XLocation($aAgent = -2)
	If IsDllStruct($aAgent) = 0 Then $aAgent = GetAgentByID($aAgent)
	Return DllStructGetData($aAgent, 'X')
EndFunc   ;==>XLocation

;~ Description: Agents Y Location
Func YLocation($aAgent = -2)
	If IsDllStruct($aAgent) = 0 Then $aAgent = GetAgentByID($aAgent)
	Return DllStructGetData($aAgent, 'Y')
EndFunc   ;==>YLocation

;~ Returns the ModelID of an Item
Func GetItemModelID($aItem)
	Return DllStructGetData($aItem, 'ModelID')
EndFunc

;~ Returns the ExtraID of an Item
Func GetItemExtraID($aItem)
	Return DllStructGetData($aItem, 'ExtraID')
EndFunc

;~ Returns the Type of an Item
Func GetItemType($aItem)
	Return DllStructGetData($aItem, 'Type')
EndFunc

;~ Returns True if the Item is of a Weapon Type
Func IsWeapon($aItem)
	Local $lType = GetItemType($aItem)
	
	Switch $lType
		Case $item_type_axe, $item_type_bow, $item_type_offhand
			Return True
		Case $item_type_hammer, $item_type_wand, $item_type_shield
			Return True
		Case $item_type_staff, $item_type_sword, $item_type_dagger
			Return True
		Case $item_type_scythe, $item_type_spear
			Return True
	EndSwitch
	Return False
EndFunc ;==>IsWeapon

Func IsRareRune($aItem)
    Local $ModStruct = GetModStruct($aItem)
	
	If StringInStr($ModStruct, "C202EA27", 0, 1) > 0 Then ; Mod struct for Sup vigor rune
		Out("Sup Vigor Rune.")
	ElseIf StringInStr($ModStruct, "C202E927", 0, 1) > 0 Then ; Major Vigor
		Out("Major Vigor Rune.")
	ElseIf StringInStr($ModStruct, "C202E827", 0, 1) > 0 Then ; Minor Vigor
		Out("Minor Vigor Rune.")
	ElseIf StringInStr($ModStruct, "25043025", 0, 1) > 0 Then ; Rune of Vitae
		Out("Rune of Vitae.")
	; ElseIf StringInStr($ModStruct, "23043025", 0, 1) > 0 Then ; Rune of Attunement
		; Out("Rune of Attunement.")
	ElseIf StringInStr($ModStruct, "D20330A5", 0, 1) > 0 Then ; Blessed insig
		Out("Blessed Insignia.")
	ElseIf StringInStr($ModStruct, "2B043025", 0, 1) > 0 Then ; Rune of Clarity
		Out("Rune of Clarity.")
	ElseIf StringInStr($ModStruct, "0100E821", 0, 1) > 0 Then ; Minor Fast Casting
		Out("Minor Fast Casting.")
	; ElseIf StringInStr($ModStruct, "0101E821", 0, 1) > 0 Then ; Minor Illusion
		; Out("Minor Illusion.")
	ElseIf StringInStr($ModStruct, "0103E821", 0, 1) > 0 Then ; Minor Inspiration
		Out("Minor Inspiration.")
	ElseIf StringInStr($ModStruct, "0200E821", 0, 1) > 0 Then ; Major Fast Casting
		Out("Major Fast Casting.")
	; ElseIf StringInStr($ModStruct, "0202E821", 0, 1) > 0 Then ; Major Domination
		; Out("Major Domination.")
	ElseIf StringInStr($ModStruct, "0302E821", 0, 1) > 0 Then ; Superior Domination
		Out("Superior Domination.")
	ElseIf StringInStr($ModStruct, "C60330A5", 0, 1) > 0 Then ; Prodigy insig
		Out("Prodigy Insignia.")
	ElseIf StringInStr($ModStruct, "0124E821", 0, 1) > 0 Then ; Minor Spawning
		Out("Minor Spawning Power.")
	; ElseIf StringInStr($ModStruct, "0122E821", 0, 1) > 0 Then ; Minor Channeling
		; Out("Minor Channeling Magic.")
	; ElseIf StringInStr($ModStruct, "0121E821", 0, 1) > 0 Then ; Minor Restoration
		; Out("Minor Restoration Magic.")
	; ElseIf StringInStr($ModStruct, "0224E821", 0, 1) > 0 Then ; Major Spawning
		; Out("Major Spawning Power.")
	ElseIf StringInStr($ModStruct, "080430A5", 0, 1) > 0 Then ; Shamans insig
		Out("Shaman's Insignia.")
	; ElseIf StringInStr($ModStruct, "0C0430A5", 0, 1) > 0 Then ; Mystic insig
		; Out("Mystic's Insignia.")
	ElseIf StringInStr($ModStruct, "0106E821", 0, 1) > 0 Then ; Minor SoulReaping
		Out("Minor Soul Reaping.")
	; ElseIf StringInStr($ModStruct, "0204E821", 0, 1) > 0 Then ; Major Blood Magic
		; Out("Major Blood Magic.")
	; ElseIf StringInStr($ModStruct, "0206E821", 0, 1) > 0 Then ; Major SoulReaping
		; Out("Major Soul Reaping.")
	; ElseIf StringInStr($ModStruct, "0205E821", 0, 1) > 0 Then ; Major Death Magic
		; Out("Major Death Magic.")
	ElseIf StringInStr($ModStruct, "D80330A5", 0, 1) > 0 Then ; Tormentor insig
		Out("Tormentor's Insignia.")
	ElseIf StringInStr($ModStruct, "14043025", 0, 1) > 0 Then ; Bloodstained insig
		Out("Bloodstained Insignia.")
	; ElseIf StringInStr($ModStruct, "EA02E827", 0, 1) > 0 Then ; Minor Absorption
		; Out("Minor Absorption.")
	; ElseIf StringInStr($ModStruct, "0111E821", 0, 1) > 0 Then ; Minor Strength
		; Out("Minor Strength.")
	; ElseIf StringInStr($ModStruct, "0112E821", 0, 1) > 0 Then ; Minor Axe Mastery
		; Out("Minor Axe Mastery.")
	; ElseIf StringInStr($ModStruct, "0113E821", 0, 1) > 0 Then ; Minor Hammer Mastery
		; Out("Minor Hammer Mastery.")
	; ElseIf StringInStr($ModStruct, "0114E821", 0, 1) > 0 Then ; Minor Swordsmanship
		; Out("Minor Swordsmanship.")
	; ElseIf StringInStr($ModStruct, "0115E821", 0, 1) > 0 Then ; Minor Tactics
		; Out("Minor Tactics.")
	ElseIf StringInStr($ModStruct, "F60330A5", 0, 1) > 0 Then ; Sentinel insig
		Out("Sentinels Insignia.")
	; ElseIf StringInStr($ModStruct, "0116E821", 0, 1) > 0 Then ; Minor Beast Mastery
		; Out("Minor Beast Mastery.")
	; ElseIf StringInStr($ModStruct, "0118E821", 0, 1) > 0 Then ; Minor Wilderness Survival
		; Out("Minor Wilderness Survival.")
	; ElseIf StringInStr($ModStruct, "0119E821", 0, 1) > 0 Then ; Minor Marksmanship
		; Out("Minor Marksmanship.")
	; ElseIf StringInStr($ModStruct, "0117E821", 0, 1) > 0 Then ; Minor Expertise
		; Out("Minor Expertise.")
	ElseIf StringInStr($ModStruct, "0110E821", 0, 1) > 0 Then ; Minor Divine Favor
		Out("Minor Divine Favor.")
	; ElseIf StringInStr($ModStruct, "010FE821", 0, 1) > 0 Then ; Minor Protection Prayers
		; Out("Minor Protection Prayers.")
	; ElseIf StringInStr($ModStruct, "F00330A5", 0, 1) > 0 Then ; Anchorite insig
		; Out("Anchorite Insignia.")
	ElseIf StringInStr($ModStruct, "010CE821", 0, 1) > 0 Then ; Minor Energy Storage
		Out("Minor Energy Storage.")
	; ElseIf StringInStr($ModStruct, "0108E821", 0, 1) > 0 Then ; Minor Air Magic
		; Out("Minor Air Magic.")
	; ElseIf StringInStr($ModStruct, "0109E821", 0, 1) > 0 Then ; Minor Earth Magic
		; Out("Minor Earth Magic.")
	; ElseIf StringInStr($ModStruct, "010BE821", 0, 1) > 0 Then ; Minor Water Magic
		; Out("Minor Water Magic.")
	; ElseIf StringInStr($ModStruct, "020CE821", 0, 1) > 0 Then ; Major Energy Storage
		; Out("Major Energy Storage.")
	; ElseIf StringInStr($ModStruct, "0123E821", 0, 1) > 0 Then ; Minor Critical Strikes
		; Out("Minor Critical Strikes.")
	; ElseIf StringInStr($ModStruct, "011DE821", 0, 1) > 0 Then ; Minor Dagger Mastery
		; Out("Minor Dagger Mastery.")
	ElseIf StringInStr($ModStruct, "C20330A5", 0, 1) > 0 Then ; Nightstalker insig
		Out("Nightstalker Insignia.")
	ElseIf StringInStr($ModStruct, "032BE821", 0, 1) > 0 Then ; Sup earth prayers
		Out("Superior Earth Prayers.")
	ElseIf StringInStr($ModStruct, "012CE821", 0, 1) > 0 Then ; Minor Mysticism
		Out("Minor Mysticism.")
	ElseIf StringInStr($ModStruct, "0129E821", 0, 1) > 0 Then ; Minor Scythe Mastery
		Out("Minor Scythe Mastery.")
	ElseIf StringInStr($ModStruct, "040430A5", 0, 1) > 0 Then ; Windwalker insig
		Out("Windwalker Insignia.")
	ElseIf StringInStr($ModStruct, "0E04708000003081", 0, 1) > 0 Then ; Centurion insig
		Out("Centurion Insignia.")
	Else
		Return False
	EndIf
	
	Return True
EndFunc ;==>IsRareRune

Func GetHasEffect($aSkillID)
	If DllStructGetData(GetEffect($aSkillID), "SkillId") = 0 Then
		Return False
	Else
		Return True
	EndIf
EndFunc
