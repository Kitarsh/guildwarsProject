

Func Items_CanPickUp($aitem)
	Local $m = DllStructGetData($aitem, 'ModelID')
	Local $i = DllStructGetData($aitem, 'extraId')
	Local $r = GetRarity($aitem)

    If (($m == 2510) OR ($m == 2511)) Then ;If is Golds coins
        Return True
	ElseIf ($m = 146) Then ;Dyes
		If Items_IsKeepedDye($i) Then
			Return True
		Else
			Return False
		EndIf
	ElseIf Array_Contains($m, $Array_ID_PreSearing_Trophies) Then ; Pickup farmable Nicholas' items
		Return True
    ElseIf Array_Contains($m, $Array_pscon) Then ; If is a Pcons or event item
		Return True
    ElseIf Array_Contains($m, $Array_Item_RareMat) Then ; If is a Rare Mat
		Return True
    ElseIf Array_Contains($m, $Array_Item_CommonMat) Then ; If is a Rare Mat
		Return True
	ElseIf Array_Contains($m, $Elite_Tome_Array) Then
		Return True
	ElseIf Array_Contains($m, $Regular_Tome_Array) Then
		Return True
	ElseIf $ITEM_ID_Lockpick = $m Then
		Return True
	ElseIf ($r == $RARITY_Green) Then
		Return True
    ElseIf ($r = $RARITY_Gold) Then
		Return True
	ElseIf ($r == $RARITY_Purple) Then
		Return False
	ElseIf ($r == $RARITY_Blue) Then
		Return False
	ElseIf ($r == $RARITY_White) Then
		Return False
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
	If ($Dye_color == $ITEM_ExtraID_White_Dye) Then
		Return True
	EndIf
	If ($Dye_color == $ITEM_ExtraID_Black_Dye) Then
		Return True
	EndIf
    Return False
EndFunc ;~ Items_IsKeepedDye
