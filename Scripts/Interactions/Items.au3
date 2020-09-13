Global $Array_pscon[39] =  [910, 5585, 6366, 6375, 22190, 24593, 28435, 30855, _
31145, 35124, 36682, 6376, 21809, 21810, 21813, 36683, _
21492, 21812, 22269, 22644, 22752, 28436,15837, 21490, _
30648, 31020, 6370, 21488, 21489, 22191, 26784, 28433, _
5656, 18345, 21491, 37765, 21833, 28433, 28434]

Global Const $ITEM_ID_PRE_Spider_Leg = 422
Global Const $ITEM_ID_PRE_Charr_Carving = 423
Global Const $ITEM_ID_PRE_Icy_Lodestone = 424
Global Const $ITEM_ID_PRE_Dull_Carapace = 425
Global Const $ITEM_ID_PRE_Gargoyle_Skull = 426
Global Const $ITEM_ID_PRE_Worn_Belt = 427
Global Const $ITEM_ID_PRE_Unnartural_Seed = 428
Global Const $ITEM_ID_PRE_Skale_Fin = 429
Global Const $ITEM_ID_PRE_Skeletal_Limb = 430
Global Const $ITEM_ID_PRE_Enchanted_Lodestone = 431
Global Const $ITEM_ID_PRE_Grawl_Necklace = 432
Global Const $ITEM_ID_PRE_Baked_Husk = 433
Global Const $ITEM_ID_Red_Iris_Flower = 2994

Global Const $RARITY_White = 2621
Global Const $RARITY_Blue = 2623
Global Const $RARITY_Gold = 2624
Global Const $RARITY_Purple = 2626
Global Const $RARITY_Green = 2627
Global Const $RARITY_Red = 33026

Global Const $ITEM_ID_Dyes = 146
Global Const $ITEM_ExtraID_Blue_Dye = 2
Global Const $ITEM_ExtraID_Green_Dye = 3
Global Const $ITEM_ExtraID_Purple_Dye = 4
Global Const $ITEM_ExtraID_Red_Dye = 5
Global Const $ITEM_ExtraID_Yellow_Dye = 6
Global Const $ITEM_ExtraID_Brown_Dye = 7
Global Const $ITEM_ExtraID_Orange_Dye = 8
Global Const $ITEM_ExtraID_Silver_Dye = 9
Global Const $ITEM_ExtraID_Black_Dye = 10
Global Const $ITEM_ExtraID_Gray_Dye = 11
Global Const $ITEM_ExtraID_White_Dye = 12
Global Const $ITEM_ExtraID_Pink_Dye = 13

Func Items_CanPickUp($aitem)
	Local $m = DllStructGetData($aitem, 'ModelID')
	Local $i = DllStructGetData($aitem, 'extraId')
	Local $r = GetRarity($aitem)

    If ($m == 2557) Then Return False ;Beautifull Feather

    If (($m == 2510) OR ($m == 2511)) Then ;If is Golds coins
        Return True
	ElseIf ($m = 146) Then ;Dyes
		If Items_IsKeepedDye($i) Then
			Return True
		Else
			Return False
		EndIf
	ElseIf (($m == $ITEM_ID_PRE_Spider_Leg) _
			OR ($m == $ITEM_ID_PRE_Charr_Carving) _
			OR ($m == $ITEM_ID_PRE_Icy_Lodestone) _
			OR ($m = $ITEM_ID_PRE_Dull_Carapace) _
			OR ($m = $ITEM_ID_PRE_Gargoyle_Skull) _
			OR ($m = $ITEM_ID_PRE_Worn_Belt) _
			OR ($m = $ITEM_ID_PRE_Unnartural_Seed) _
			OR ($m = $ITEM_ID_PRE_Skale_Fin) _
			OR ($m = $ITEM_ID_PRE_Skeletal_Limb) _
			OR ($m = $ITEM_ID_PRE_Enchanted_Lodestone) _
			OR ($m = $ITEM_ID_PRE_Grawl_Necklace) _
			OR ($m = $ITEM_ID_PRE_Baked_Husk) _
			OR ($m = $ITEM_ID_Red_Iris_Flower)) Then ;Pickup farmable Nicholas' items
		Return True
    ElseIf Items_CheckArrayPscon($m) Then ; If is a Pcons or event item
		Return True
	ElseIf ($r == $RARITY_Green) Then
		Return True
    ElseIf ($r = $RARITY_Gold) Then
		Return True
	ElseIf ($r == $RARITY_Purple) Then
		Return True
	ElseIf ($r == $RARITY_Blue) Then
		Return True
	ElseIf ($r == $RARITY_White) Then
		Return false
	Else
		Return False
	EndIf
EndFunc   ;==>CanPickUp

;~ Description : Returns true or false if this dye is keep.
Func Items_IsKeepedDye($Dye_color) 
	If ($Dye_color == $ITEM_ExtraID_Blue_Dye) Then
		Return False
	EndIf
	If ($Dye_color == $ITEM_ExtraID_Green_Dye) Then
		Return False
	EndIf
	If ($Dye_color == $ITEM_ExtraID_Purple_Dye) Then
		Return False
	EndIf
	If ($Dye_color == $ITEM_ExtraID_Red_Dye) Then
		Return False
	EndIf
	If ($Dye_color == $ITEM_ExtraID_Yellow_Dye) Then
		Return False
	EndIf
	If ($Dye_color == $ITEM_ExtraID_Brown_Dye) Then
		Return False
	EndIf
	If ($Dye_color == $ITEM_ExtraID_Orange_Dye) Then
		Return False
	EndIf
	If ($Dye_color == $ITEM_ExtraID_Silver_Dye) Then
		Return False
	EndIf
    If ($Dye_color == $ITEM_ExtraID_Pink_Dye) Then
		Return False
	EndIf
	If ($Dye_color == $ITEM_ExtraID_White_Dye) Then ;White dye
		Return True
	EndIf
	If ($Dye_color == $ITEM_ExtraID_Black_Dye) Then ;Black dye
		Return True
	EndIf
    Return False
EndFunc ;~ Items_IsKeepedDye


Func Items_CheckArrayPscon($lModelID)
	For $p = 0 To (UBound($Array_pscon) -1)
		If ($lModelID == $Array_pscon[$p]) Then Return True
	Next
EndFunc ;~ Items_CheckArrayPscon
