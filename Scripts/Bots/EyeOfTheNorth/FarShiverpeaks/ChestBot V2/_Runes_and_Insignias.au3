

Func IsPerfectShield($aItem) ; Need to add -5(20%)
    Local $ModStruct = GetModStruct($aItem)
    ; Universal mods
    Local $Plus30 = StringInStr($ModStruct, "1E4823", 0, 1) ; Mod struct for +30 (shield only?)
    Local $Minus3Hex = StringInStr($ModStruct, "3009820", 0, 1) ; Mod struct for -3wHex (shield only?)
    Local $Minus2Stance = StringInStr($ModStruct, "200A820", 0, 1) ; Mod Struct for -2Stance
;#include "GWA2_Headers.au3"
    Local $Minus2Ench = StringInStr($ModStruct, "2008820", 0, 1) ; Mod struct for -2Ench
    Local $Plus45Stance = StringInStr($ModStruct, "02D8823", 0, 1) ; For +45Stance
    Local $Plus45Ench = StringInStr($ModStruct, "02D6823", 0, 1) ; Mod struct for +40ench
    Local $Plus44Ench = StringInStr($ModStruct, "02C6823", 0, 1) ; For +44/+10Demons
    Local $Minus520 = StringInStr($ModStruct, "5147820", 0, 1) ; For -5(20%)
    ; +1 20% Mods
    Local $PlusDomination = StringInStr($ModStruct, "0218240", 0, 1) ; +1 Dom 20%
    Local $PlusDivine = StringInStr($ModStruct, "1018240", 0, 1) ; +1 Divine 20%
    Local $PlusSmite = StringInStr($ModStruct, "0E18240", 0, 1) ; +1 Smite 20%
    Local $PlusHealing = StringInStr($ModStruct, "0D18240", 0, 1) ; +1 Heal 20%
    Local $PlusProt = StringInStr($ModStruct, "0F18240", 0, 1) ; +1 Prot 20%
    Local $PlusFire = StringInStr($ModStruct, "0A18240", 0, 1) ; +1 Fire 20%
    Local $PlusWater = StringInStr($ModStruct, "0B18240", 0, 1) ; +1 Water 20%
    Local $PlusAir = StringInStr($ModStruct, "0818240", 0, 1) ; +1 Air 20%
    Local $PlusEarth = StringInStr($ModStruct, "0918240", 0, 1) ; +1 Earth 20%
    Local $PlusDeath = StringInStr($ModStruct, "0518240", 0, 1) ; +1 Death 20%
    Local $PlusBlood = StringInStr($ModStruct, "0418240", 0, 1) ; +1 Blood 20%
    ; +10vs Mods
    Local $PlusDemons = StringInStr($ModStruct, "A0848210", 0, 1) ; +10vs Demons
    Local $PlusPiercing = StringInStr($ModStruct, "A0118210", 0, 1) ; +10vs Piercing
    Local $PlusDragons = StringInStr($ModStruct, "A0948210", 0, 1) ; +10vs Dragons
    Local $PlusLightning = StringInStr($ModStruct, "A0418210", 0, 1) ; +10vs Lightning
    Local $PlusVsEarth = StringInStr($ModStruct, "A0B18210", 0, 1) ; +10vs Earth
    Local $PlusPlants = StringInStr($ModStruct, "A0348210", 0, 1) ; +10vs Plants
    Local $PlusCold = StringInStr($ModStruct, "A0318210", 0, 1) ; +10 vs Cold
    Local $PlusUndead = StringInStr($ModStruct, "A0048210", 0, 1) ; +10vs Undead
    Local $PlusSlashing = StringInStr($ModStruct, "A0218210", 0, 1) ; +10vs Slashing
    Local $PlusTengu = StringInStr($ModStruct, "A0748210", 0, 1) ; +10vs Tengu
    Local $PlusVsFire = StringInStr($ModStruct, "A0518210", 0, 1) ; +10vs Fire

    If $Plus30 > 0 Then
       If $PlusDemons > 0 Or $PlusPiercing > 0 Or $PlusDragons > 0 Or $PlusLightning > 0 Or $PlusVsEarth > 0 Or $PlusPlants > 0 Or $PlusCold > 0 Or $PlusUndead > 0 Or $PlusSlashing > 0 Or $PlusTengu > 0 Or $PlusVsFire > 0 Then
          Return True
       ElseIf $PlusDomination > 0 Or $PlusDivine > 0 Or $PlusSmite > 0 Or $PlusHealing > 0 Or $PlusProt > 0 Or $PlusFire > 0 Or $PlusWater > 0 Or $PlusAir > 0 Or $PlusEarth > 0 Or $PlusDeath > 0 Or $PlusBlood > 0 Then
          Return True
       ElseIf $Minus2Stance > 0 Or $Minus2Ench > 0 Or $Minus520 > 0 Or $Minus3Hex > 0 Then
          Return True
       Else
          Return False
       EndIf
    EndIf
    If $Plus45Ench > 0 Then
       If $PlusDemons > 0 Or $PlusPiercing > 0 Or $PlusDragons > 0 Or $PlusLightning > 0 Or $PlusVsEarth > 0 Or $PlusPlants > 0 Or $PlusCold > 0 Or $PlusUndead > 0 Or $PlusSlashing > 0 Or $PlusTengu > 0 Or $PlusVsFire > 0 Then
          Return True
       ElseIf $Minus2Ench > 0 Then
          Return True
       ElseIf $PlusDomination > 0 Or $PlusDivine > 0 Or $PlusSmite > 0 Or $PlusHealing > 0 Or $PlusProt > 0 Or $PlusFire > 0 Or $PlusWater > 0 Or $PlusAir > 0 Or $PlusEarth > 0 Or $PlusDeath > 0 Or $PlusBlood > 0 Then
          Return True
       Else
          Return False
       EndIf
    EndIf
    If $Minus2Ench > 0 Then
       If $PlusDemons > 0 Or $PlusPiercing > 0 Or $PlusDragons > 0 Or $PlusLightning > 0 Or $PlusVsEarth > 0 Or $PlusPlants > 0 Or $PlusCold > 0 Or $PlusUndead > 0 Or $PlusSlashing > 0 Or $PlusTengu > 0 Or $PlusVsFire > 0 Then
          Return True
       EndIf
    EndIf
    If $Plus44Ench > 0 Then
       If $PlusDemons > 0 Then
          Return True
       EndIf
    EndIf
    If $Plus45Stance > 0 Then
       If $Minus2Stance > 0 Then
          Return True
       EndIf
    EndIf
    Return False
 EndFunc
 Func IsPerfectStaff($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $A = GetItemAttribute($aItem)
    ; Ele mods
    Local $Fire20Casting = StringInStr($ModStruct, "0A141822", 0, 1) ; Mod struct for 20% fire
    Local $Water20Casting = StringInStr($ModStruct, "0B141822", 0, 1) ; Mod struct for 20% water
    Local $Air20Casting = StringInStr($ModStruct, "08141822", 0, 1) ; Mod struct for 20% air
    Local $Earth20Casting = StringInStr($ModStruct, "09141822", 0, 1)
    Local $Energy20Casting = StringInStr($ModStruct, "0C141822", 0, 1)
    ; Monk mods
    Local $Smite20Casting = StringInStr($ModStruct, "0E141822", 0, 1) ; Mod struct for 20% smite
    Local $Divine20Casting = StringInStr($ModStruct, "10141822", 0, 1) ; Mod struct for 20% divine
    Local $Healing20Casting = StringInStr($ModStruct, "0D141822", 0, 1) ; Mod struct for 20% healing
    Local $Protection20Casting = StringInStr($ModStruct, "0F141822", 0, 1) ; Mod struct for 20% protection
    ; Rit mods
    Local $Channeling20Casting = StringInStr($ModStruct, "22141822", 0, 1) ; Mod struct for 20% channeling
    Local $Restoration20Casting = StringInStr($ModStruct, "21141822", 0, 1)
    ; Mes mods
    Local $Domination20Casting = StringInStr($ModStruct, "02141822", 0, 1) ; Mod struct for 20% domination
    ; Necro mods
    Local $Death20Casting = StringInStr($ModStruct, "05141822", 0, 1) ; Mod struct for 20% death
    Local $Blood20Casting = StringInStr($ModStruct, "04141822", 0, 1)

    Switch $A
    Case 2 ; Domination
       If $Domination20Casting > 0 Then
          Return True
       Else
          Return False
       EndIf
    Case 4 ; Blood
       If $Blood20Casting > 0 Then
          Return True
       Else
          Return False
       EndIf
    Case 5 ; Death
       If $Death20Casting > 0 Then
          Return True
       Else
          Return False
       EndIf
    Case 8 ; Air
       If $Air20Casting > 0 Then
          Return True
       Else
          Return False
       EndIf
    Case 9 ; Earth
       If $Earth20Casting > 0 Then
          Return True
       Else
          Return False
       EndIf
    Case 10 ; Fire
       If $Fire20Casting > 0 Then
          Return True
       Else
          Return False
       EndIf
    Case 11 ; Water
       If $Water20Casting > 0 Then
          Return True
       Else
          Return False
       EndIf
    Case 12 ; Energy Storage
       If $Air20Casting > 0 Or $Earth20Casting > 0 Or $Fire20Casting > 0 Or $Water20Casting > 0 Then
          Return True
       Else
          Return False
       EndIf
    Case 13 ; Healing
       If $Healing20Casting > 0 Then
          Return True
       Else
          Return False
       EndIf
    Case 14 ; Smiting
       If $Smite20Casting > 0 Then
          Return True
       Else
          Return False
       EndIf
    Case 15 ; Protection
       If $Protection20Casting > 0 Then
          Return True
       Else
          Return False
       EndIf
    Case 16 ; Divine
       If $Healing20Casting > 0 Or $Protection20Casting > 0 Or $Divine20Casting > 0 Then
          Return True
       Else
          Return False
       EndIf
    Case 33 ; Restoration
       If $Restoration20Casting > 0 Then
          Return True
       Else
          Return False
       EndIf
    Case 34 ; Channeling
       If $Channeling20Casting > 0 Then
          Return True
       Else
          Return False
       EndIf
    EndSwitch
    Return False
 EndFunc
 Func IsPerfectCaster($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $A = GetItemAttribute($aItem)
    ; Universal mods
    Local $PlusFive = StringInStr($ModStruct, "5320823", 0, 1) ; Mod struct for +5^50
    Local $PlusFiveEnch = StringInStr($ModStruct, "500F822", 0, 1)
    Local $10Cast = StringInStr($ModStruct, "A0822", 0, 1) ; Mod struct for 10% cast
    Local $10Recharge = StringInStr($ModStruct, "AA823", 0, 1) ; Mod struct for 10% recharge
    ; Ele mods
    Local $Fire20Casting = StringInStr($ModStruct, "0A141822", 0, 1) ; Mod struct for 20% fire
    Local $Fire20Recharge = StringInStr($ModStruct, "0A149823", 0, 1)
    Local $Water20Casting = StringInStr($ModStruct, "0B141822", 0, 1) ; Mod struct for 20% water
    Local $Water20Recharge = StringInStr($ModStruct, "0B149823", 0, 1)
    Local $Air20Casting = StringInStr($ModStruct, "08141822", 0, 1) ; Mod struct for 20% air
    Local $Air20Recharge = StringInStr($ModStruct, "08149823", 0, 1)
    Local $Earth20Casting = StringInStr($ModStruct, "09141822", 0, 1)
    Local $Earth20Recharge = StringInStr($ModStruct, "09149823", 0, 1)
    Local $Energy20Casting = StringInStr($ModStruct, "0C141822", 0, 1)
    Local $Energy20Recharge = StringInStr($ModStruct, "0C149823", 0, 1)
    ; Monk mods
    Local $Smiting20Casting = StringInStr($ModStruct, "0E141822", 0, 1) ; Mod struct for 20% smite
    Local $Smiting20Recharge = StringInStr($ModStruct, "0E149823", 0, 1)
    Local $Divine20Casting = StringInStr($ModStruct, "10141822", 0, 1) ; Mod struct for 20% divine
    Local $Divine20Recharge = StringInStr($ModStruct, "10149823", 0, 1)
    Local $Healing20Casting = StringInStr($ModStruct, "0D141822", 0, 1) ; Mod struct for 20% healing
    Local $Healing20Recharge = StringInStr($ModStruct, "0D149823", 0, 1)
    Local $Protection20Casting = StringInStr($ModStruct, "0F141822", 0, 1) ; Mod struct for 20% protection
    Local $Protection20Recharge = StringInStr($ModStruct, "0F149823", 0, 1)
    ; Rit mods
    Local $Channeling20Casting = StringInStr($ModStruct, "22141822", 0, 1) ; Mod struct for 20% channeling
    Local $Channeling20Recharge = StringInStr($ModStruct, "22149823", 0, 1)
    Local $Restoration20Casting = StringInStr($ModStruct, "21141822", 0, 1)
    Local $Restoration20Recharge = StringInStr($ModStruct, "21149823", 0, 1)
    ; Mes mods
    Local $Domination20Casting = StringInStr($ModStruct, "02141822", 0, 1) ; Mod struct for 20% domination
    Local $Domination20Recharge = StringInStr($ModStruct, "02149823", 0, 1) ; Mod struct for 20% domination recharge
    ; Necro mods
    Local $Death20Casting = StringInStr($ModStruct, "05141822", 0, 1) ; Mod struct for 20% death
    Local $Death20Recharge = StringInStr($ModStruct, "05149823", 0, 1)
    Local $Blood20Recharge = StringInStr($ModStruct, "04149823", 0, 1)
    Local $Blood20Casting = StringInStr($ModStruct, "04141822", 0, 1)

    Switch $A
    Case 2 ; Domination
       If $PlusFive > 0 Or $PlusFiveEnch > 0 Then
          If $Domination20Casting > 0 Or $Domination20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Domination20Recharge > 0 Or $Domination20Casting > 0 Then
          If $10Cast > 0 Or $10Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Domination20Recharge > 0 Then
          If $Domination20Casting > 0 Then
             Return True
          EndIf
       EndIf
       Return False
    Case 4 ; Blood
       If $PlusFive > 0 Or $PlusFiveEnch > 0 Then
          If $Blood20Casting > 0 Or $Blood20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Blood20Recharge > 0 Or $Blood20Casting > 0 Then
          If $10Cast > 0 Or $10Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Blood20Recharge > 0 Then
          If $Blood20Casting > 0 Then
             Return True
          EndIf
       EndIf
       Return False
    Case 5 ; Death
       If $PlusFive > 0 Or $PlusFiveEnch > 0 Then
          If $Death20Casting > 0 Or $Death20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Death20Recharge > 0 Or $Death20Casting > 0 Then
          If $10Cast > 0 Or $10Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Death20Recharge > 0 Then
          If $Death20Casting > 0 Then
             Return True
          EndIf
       EndIf
       Return False
    Case 8 ; Air
       If $PlusFive > 0 Or $PlusFiveEnch > 0 Then
          If $Air20Casting > 0 Or $Air20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Air20Recharge > 0 Or $Air20Casting > 0 Then
          If $10Cast > 0 Or $10Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Air20Recharge > 0 Then
          If $Air20Casting > 0 Then
             Return True
          EndIf
       EndIf
       Return False
    Case 9 ; Earth
       If $PlusFive > 0 Or $PlusFiveEnch > 0 Then
          If $Earth20Casting > 0 Or $Earth20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Earth20Recharge > 0 Or $Earth20Casting > 0 Then
          If $10Cast > 0 Or $10Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Earth20Recharge > 0 Then
          If $Earth20Casting > 0 Then
             Return True
          EndIf
       EndIf
       Return False
    Case 10 ; Fire
       If $PlusFive > 0 Or $PlusFiveEnch > 0 Then
          If $Fire20Casting > 0 Or $Fire20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Fire20Recharge > 0 Or $Fire20Casting > 0 Then
          If $10Cast > 0 Or $10Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Fire20Recharge > 0 Then
          If $Fire20Casting > 0 Then
             Return True
          EndIf
       EndIf
       Return False
    Case 11 ; Water
       If $PlusFive > 0 Or $PlusFiveEnch > 0 Then
          If $Water20Casting > 0 Or $Water20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Water20Recharge > 0 Or $Water20Casting > 0 Then
          If $10Cast > 0 Or $10Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Water20Recharge > 0 Then
          If $Water20Casting > 0 Then
             Return True
          EndIf
       EndIf
       Return False
    Case 12 ; Energy Storage
       If $PlusFive > 0 Or $PlusFiveEnch > 0 Then
          If $Energy20Casting > 0 Or $Energy20Recharge > 0 Or $Water20Casting > 0 Or $Water20Recharge > 0 Or $Fire20Casting > 0 Or $Fire20Recharge > 0 Or $Earth20Casting > 0 Or $Earth20Recharge > 0 Or $Air20Casting > 0 Or $Air20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Energy20Recharge > 0 Or $Energy20Casting > 0 Then
          If $10Cast > 0 Or $10Recharge > 0 Or $Water20Casting > 0 Or $Water20Recharge > 0 Or $Fire20Casting > 0 Or $Fire20Recharge > 0 Or $Earth20Casting > 0 Or $Earth20Recharge > 0 Or $Air20Casting > 0 Or $Air20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Energy20Recharge > 0 Then
          If $Energy20Casting > 0 Then
             Return True
          EndIf
       EndIf
       If $10Cast > 0 Or $10Recharge > 0 Then
          If $Water20Casting > 0 Or $Water20Recharge > 0 Or $Fire20Casting > 0 Or $Fire20Recharge > 0 Or $Earth20Casting > 0 Or $Earth20Recharge > 0 Or $Air20Casting > 0 Or $Air20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       Return False
    Case 13 ; Healing
       If $PlusFive > 0 Or $PlusFiveEnch > 0 Then
          If $Healing20Casting > 0 Or $Healing20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Healing20Recharge > 0 Or $Healing20Casting > 0 Then
          If $10Cast > 0 Or $10Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Healing20Recharge > 0 Then
          If $Healing20Casting > 0 Then
             Return True
          EndIf
       EndIf
       Return False
    Case 14 ; Smiting
       If $PlusFive > 0 Or $PlusFiveEnch > 0 Then
          If $Smiting20Casting > 0 Or $Smiting20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Smiting20Recharge > 0 Or $Smiting20Casting > 0 Then
          If $10Cast > 0 Or $10Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Smiting20Recharge > 0 Then
          If $Smiting20Casting > 0 Then
             Return True
          EndIf
       EndIf
       Return False
    Case 15 ; Protection
       If $PlusFive > 0 Or $PlusFiveEnch > 0 Then
          If $Protection20Casting > 0 Or $Protection20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Protection20Recharge > 0 Or $Protection20Casting > 0 Then
          If $10Cast > 0 Or $10Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Protection20Recharge > 0 Then
          If $Protection20Casting > 0 Then
             Return True
          EndIf
       EndIf
       Return False
    Case 16 ; Divine
       If $PlusFive > 0 Or $PlusFiveEnch > 0 Then
          If $Divine20Casting > 0 Or $Divine20Recharge > 0 Or $Healing20Casting > 0 Or $Healing20Recharge > 0 Or $Smiting20Casting > 0 Or $Smiting20Recharge > 0 Or $Protection20Casting > 0 Or $Protection20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Divine20Recharge > 0 Or $Divine20Casting > 0 Then
          If $10Cast > 0 Or $10Recharge > 0 Or $Healing20Casting > 0 Or $Healing20Recharge > 0 Or $Smiting20Casting > 0 Or $Smiting20Recharge > 0 Or $Protection20Casting > 0 Or $Protection20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Divine20Recharge > 0 Then
          If $Divine20Casting > 0 Then
             Return True
          EndIf
       EndIf
       If $10Cast > 0 Or $10Recharge > 0 Then
          If $Healing20Casting > 0 Or $Healing20Recharge > 0 Or $Smiting20Casting > 0 Or $Smiting20Recharge > 0 Or $Protection20Casting > 0 Or $Protection20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       Return False
    Case 33 ; Restoration
       If $PlusFive > 0 Or $PlusFiveEnch > 0 Then
          If $Restoration20Casting > 0 Or $Restoration20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Restoration20Recharge > 0 Or $Restoration20Casting > 0 Then
          If $10Cast > 0 Or $10Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Restoration20Recharge > 0 Then
          If $Restoration20Casting > 0 Then
             Return True
          EndIf
       EndIf
       Return False
    Case 34 ; Channeling
       If $PlusFive > 0 Or $PlusFiveEnch > 0 Then
          If $Channeling20Casting > 0 Or $Channeling20Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Channeling20Recharge > 0 Or $Channeling20Casting > 0 Then
          If $10Cast > 0 Or $10Recharge > 0 Then
             Return True
          EndIf
       EndIf
       If $Channeling20Recharge > 0 Then
          If $Channeling20Casting > 0 Then
             Return True
          EndIf
       EndIf
       Return False
    EndSwitch
    Return False
 EndFunc

Func IsRareMaterial($aItem)
   Local $M = DllStructGetData($aItem, "ModelID")

   Switch $M
   Case 937, 938, 935, 931, 932, 936, 930
      Return True ; Rare Mats
   EndSwitch
   Return False
EndFunc
 Func IsSpecialItem($aItem)
    Local $ModelID = DllStructGetData($aItem, "ModelID")
    Local $ExtraID = DllStructGetData($aItem, "ExtraID")

    Switch $ModelID
    Case 5656, 18345, 21491, 37765, 21833, 28433, 28434
       Return True ; Special - ToT etc
    Case 22751
       Return True ; Lockpicks
    Case 27047
       Return True ; Glacial Stones
    Case 21796, 21797, 21798, 21799, 21800, 21801, 21802, 21803, 21804, 21805, 21786, 21787, 21788, 21789, 21790, 21791, 21792, 21793, 21794, 21795
       Return True ; All Tomes
    Case 146
       If $ExtraID = 10 Or $ExtraID = 12 Then
          Return True ; Black & White Dye
       Else
          Return False
       EndIf
    Case 24353, 24354
       Return True ; Chalice & Rin Relics
    Case 27052
       Return True ; Superb Charr Carving
    Case 522
       Return True ; Dark Remains
    Case 3746, 22280
       Return True ; Underworld & FOW Scroll
    Case 819
       Return True ; Dragon Root
    Case 35121
       Return True ; War supplies
    Case 36985
       Return True ; Commendations
    EndSwitch
    Return False
 EndFunc
 Func IsPcon($aItem)
    Local $ModelID = DllStructGetData($aItem, "ModelID")

    Switch $ModelID
    Case 910, 2513, 5585, 6049, 6366, 6367, 6375, 15477, 19171, 19172, 19173, 22190, 24593, 28435, 30855, 31145, 31146, 35124, 36682
       Return True ; Alcohol
    Case 6376, 21809, 21810, 21813, 36683
       Return True ; Party
    Case 21492, 21812, 22269, 22644, 22752, 28436
       Return True ; Sweets
    Case 6370, 21488, 21489, 22191, 26784, 28433
       Return True ; DP Removal
    Case 15837, 21490, 30648, 31020
       Return True ; Tonic
    EndSwitch
    Return False
 EndFunc
 Func IsReq8Max($aItem)
    Local $Req = GetItemReq($aItem)
    Local $Attribute = GetItemAttribute($aItem)
    Local $Rarity = GetRarity($aItem)
    Local $Dmg = GetItemMaxDmg($aItem)

    Switch $Rarity
    Case 2624
       If $Req = 8 Then
          If $Attribute = 20 Or $Attribute = 21 Or $Attribute = 17 Then
             If $Dmg = 22 Or $Dmg = 16 Then
                Return True
             EndIf
          EndIf
       EndIf
    Case 2623
       If $Req = 8 Then
          If $Attribute = 20 Or $Attribute = 21 Or $Attribute = 17 Then
             If $Dmg = 22 Or $Dmg = 16 Then
                Return True
             EndIf
          EndIf
       EndIf
    Case 2626
       If $Req = 8 Then
          If $Attribute = 20 Or $Attribute = 21 Or $Attribute = 17 Then
             If $Dmg = 22 Or $Dmg = 16 Then
                Return True
             EndIf
          EndIf
       EndIf
    EndSwitch
    Return False
 EndFunc
Func GetItemMaxDmg($aItem)
    If Not IsDllStruct($aItem) Then $aItem = GetItemByItemID($aItem)
    Local $lModString = GetModStruct($aItem)
    Local $lPos = StringInStr($lModString, "A8A7") ; Weapon Damage
    If $lPos = 0 Then $lPos = StringInStr($lModString, "C867") ; Energy (focus)
    If $lPos = 0 Then $lPos = StringInStr($lModString, "B8A7") ; Armor (shield)
    If $lPos = 0 Then Return 0
    Return Int("0x" & StringMid($lModString, $lPos - 2, 2))
 EndFunc


Func IsNiceModDef($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")
	 
	Local $ArmorAlways = StringInStr($ModStruct, "05000821", 0 ,1) ; Armor +5
       If $ArmorAlways > 0 And ($t = 36) Then ; 26 is Staff Head or Wrapping
            Return True
            Return False
       EndIf
EndFunc	   
	   
Func IsNiceModWard($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")
	 
	Local $ofWarding = StringInStr($ModStruct, "07002821", 0 ,1) ; +7 Armor vs Elemental
	If $ofWarding > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then ; 26 is Staff Wrapping
		Return True
		Return False
	EndIf
EndFunc   

Func IsNiceModAdren($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

    Local $FuriousPrefix = StringInStr($ModStruct, "0A00B823", 0 ,1) ; Axe haft, Dagger Tang, Hammer Haft, Scythe Snathe, Spearhead, Sword Hilt
       If $FuriousPrefix > 0 And ($t = 36) Then
            Return True
            Return False
    EndIf
EndFunc

Func IsNiceModZeal($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

	Local $ZealousPrefix = StringInStr($ModStruct, "01001825", 0 ,1) ; Axe haft, Bow String, Dagger Tang, Hammer Haft, Scythe Snathe, Spearhead, Sword Hilt
	If $ZealousPrefix > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModUndead($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

	Local $ofDeathbane = StringInStr($ModStruct, "00008080", 0 ,1) ; Damge 20% (vs Undead)
	If $ofDeathbane > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27) Then
		Return True
		Return False
	EndIf
	
EndFunc

Func IsNiceModVamp($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

	Local $Vampiric5Prefix = StringInStr($ModStruct, "00052825", 0 ,1) ; Bow String, Hammer Haft, Scythe Snathe
	If $Vampiric5Prefix > 0 And ($t = 5 Or $t = 15 Or $t = 35) Then
		Return True
		Return False
	EndIf
	
	Local $Vampiric3Prefix = StringInStr($ModStruct, "00032825", 0 ,1) ; Axe Haft, Dagger Tang, Spearhead, Sword Hilt
	If $Vampiric3Prefix > 0 And ($t = 2 Or $t = 27 Or $t = 32 Or $t = 36) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModEnch($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

	Local $ofEnchanting = StringInStr($ModStruct, "1400B822", 0 ,1) ; +20% Enchantment Duration
	If $ofEnchanting > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then ; 26 is Staff Wrapping
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceMod30HP($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

    Local $HealthAlways = StringInStr($ModStruct, "001E4823", 0 ,1) ; +30 Health
        If $HealthAlways > 0 And ($t = 24 Or $t = 27 Or $t = 36) Then ; 12 is focus core, 26 can be Staff Head or Wrap
            Return True
            Return False
        EndIf
EndFunc

Func IsNiceMod45HP($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

	Local $ofDevotion = StringInStr($ModStruct, "002D6823", 0 ,1) ; +45 Health while Enchanted
	If $ofDevotion > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; 12 is Focus core, 24 is shield handle, 26 is staff wrapping
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceMod4040($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

    Local $HCT20 = StringInStr($ModStruct, "00140828", 0 ,1) ; Halves casting time of spells of item's attribute (Chance: 20%)
        If $HCT20 > 0 And ($t = 12 Or $t = 22 Or $t = 26) Then; 12 is Focus core of aptitude, 22 is Inscription Aptitude Not Attitude, 26 is Inscription or Adept Staff head
            Return True
            Return False
        EndIf

    Local $HSR20 = StringInStr($ModStruct, "00142828", 0, 1) ; Halves skill recharge of spells (Chance: 20%)
        If $HSR20 > 0 And ($t = 12 Or $t = 22) Then ; 12 is Forget Me Not, 22 is Wand Wrapping of Memory
            Return True
            Return False
        EndIf
EndFunc



;Damage Modifiers

Func IsNiceModSaH($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $StrengthAndHonor = StringInStr($ModStruct, "0F327822", 0 ,1) ; Damage +15% (while Health is above 50%)
	If $StrengthAndHonor > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModGbF($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $GuidedByFate = StringInStr($ModStruct, "0F006822", 0 ,1) ; Damage +15% (while Enchanted)
	If $GuidedByFate > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModDwD($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $DanceWithDeath = StringInStr($ModStruct, "0F00A822", 0 ,1) ; Damage +15% (while in a Stance)
	If $DanceWithDeath > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModTMI($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $TooMuchInformation = StringInStr($ModStruct, "0F005822", 0 ,1) ; Damage +15% (vs Hexed Foes)
	If $TooMuchInformation > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModTtP($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $DamageAlways = StringInStr($ModStruct, "0F003822", 0 ,1) ; Damage +15%
Local $ToThePain = StringInStr($ModStruct, "0A001820", 0 ,1) ; Damage +15% And Armor -10 (while attacking)
	If ($DamageAlways > 0 And $ToThePain > 0 ) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModBoB($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $DamageAlways = StringInStr($ModStruct, "0F003822", 0 ,1) ; Damage +15%
Local $EnergyMinus5 = StringInStr($ModStruct, "0500B820", 0 ,1) ; Damage +15% And Energy -5
	If ($DamageAlways > 0 And $EnergyMinus5 > 0) Then ; Brawn Over Brains
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModVIM($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $VengeanceIsMine = StringInStr($ModStruct, "14328822", 0 ,1) ; Damage 20% (while Health is below 50%)
	If $VengeanceIsMine > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModDFtR($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $DontFearTheReaper = StringInStr($ModStruct, "14009822", 0 ,1) ; Damage 20% (while Hexed)
	If $DontFearTheReaper > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModBarbed($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $BarbedPrefix = StringInStr($ModStruct, "DE016824", 0 ,1)
	If $BarbedPrefix > 0 And ($t = 2 Or $t = 5 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModCruel($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $CruelPrefix = StringInStr($ModStruct, "E2016824", 0 ,1)
	If $CruelPrefix > 0 And ($t = 2 Or $t = 15 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModCrippling($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $CripplingPrefix = StringInStr($ModStruct, "E1016824", 0 ,1)
	If $CripplingPrefix > 0 And ($t = 2 Or $t = 5 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModHeavy($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $HeavyPrefix = StringInStr($ModStruct, "E601824", 0 ,1)
	If $HeavyPrefix > 0 And ($t = 2 Or $t = 15 Or $t = 27 Or $t = 35 Or $t = 36) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModPoisonous($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $PoisonousPrefix = StringInStr($ModStruct, "E4016824", 0 ,1)
	If $PoisonousPrefix > 0 And ($t = 2 Or $t = 5 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModSilencing($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $SilencingPrefix = StringInStr($ModStruct, "E5016824", 0 ,1)
	If $SilencingPrefix > 0 And ($t = 5 Or $t = 32 Or $t = 36) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModEbon($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $EbonPrefix = StringInStr($ModStruct, "000BB824", 0 ,1) ; Changes Damage to Earth
	If $EbonPrefix > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModFiery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $FieryPrefix = StringInStr($ModStruct, "0005B824", 0 ,1) ; Changes Damage to Fire
	If $FieryPrefix > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModIcy($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $IcyPrefix = StringInStr($ModStruct, "0003B824", 0 ,1) ; Changes Damage to Cold
	If $IcyPrefix > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModShock($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ShockingPrefix = StringInStr($ModStruct, "0004B824", 0 ,1) ; Changes Damage to Lightning
	If $ShockingPrefix > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModSundering($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $SunderingPrefix = StringInStr($ModStruct, "1414F823", 0 ,1) ; Axe haft, Bow String, Dagger Tang, Hammer Haft, Scythe Snathe, Spearhead, Sword Hilt
	If $SunderingPrefix > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then
		Return True
		Return False
	EndIf
EndFunc

;Caster Inscripts/Mods

Func IsNiceMod5E($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $EnergyAlways5 = StringInStr($ModStruct, "0500D822", 0 ,1) ; Energy +5
	If $EnergyAlways5 > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then ; 2/5/15/27/32/35/36 are I Have the Power, 26 is Insightful Staff Head
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceMod5EAbove50($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $HaleAndHearty = StringInStr($ModStruct, "05320823", 0 ,1) ; Energy +5 (while health is above 50%)
	If $HaleAndHearty > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModHaveFaith($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $HaveFaith = StringInStr($ModStruct, "0500F822", 0 ,1) ; Energy +5 (while Enchanted)
	If $HaveFaith > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModHaveE7Below50($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $DontCallItAComeback = StringInStr($ModStruct, "07321823", 0 ,1) ; Energy +7 (while Health is below 50%)
	If $DontCallItAComeback > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModHave7EHex($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $IAmSorrow = StringInStr($ModStruct, "07002823", 0 ,1) ; Energy +7 (while hexed)
	If $IAmSorrow > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModLFT($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $EnergyAlways15 = StringInStr($ModStruct, "0F00D822", 0 ,1) ; Energy +15
Local $EnergyRegen = StringInStr($ModStruct, "0100C820", 0 ,1) ; Energy regeneration -1
	If ($EnergyAlways15 > 0 And $EnergyRegen > 0) And ($t = 12 Or $t = 22 Or $t = 26) Then ; 12 s Live For Today, 22/26 are Seize the Day
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModHCT20($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $HCT20 = StringInStr($ModStruct, "00140828", 0 ,1) ; Halves casting time of spells of item's attribute (Chance: 20%)
	If $HCT20 > 0 And ($t = 12 Or $t = 22 Or $t = 26) Then; 12 is Focus core of aptitude, 22 is Inscription Aptitude Not Attitude, 26 is Inscription or Adept Staff head
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModANA($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $HCT20 = StringInStr($ModStruct, "00140828", 0 ,1) ; Halves casting time of spells of item's attribute (Chance: 20%)
	If $HCT20 > 0 And ( $t = 22) Then; 12 is Focus core of aptitude, 22 is Inscription Aptitude Not Attitude, 26 is Inscription or Adept Staff head
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModHCT10($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $HCT10 = StringInStr($ModStruct, "000A0822", 0 ,1) ; Halves casting time of spells (Chance: 10%)
	If $HCT10 > 0 And ($t = 2 Or $t = 5 Or $t = 12 Or $t = 15 Or $t = 22 Or $t = 26 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then; 12 is Focus core of Swiftness, (2, 5, 15, 22, 27, 32, 35, 36) is Don't Think Twice, 26 is Don't Think Twice or Swift Staff head
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModHSR20($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $HSR20 = StringInStr($ModStruct, "00142828", 0, 1) ; Halves skill recharge of spells (Chance: 20%)
	If $HSR20 > 0 And ($t = 12 Or $t = 22) Then ; 12 is Forget Me Not, 22 is Wand Wrapping of Memory
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModFMN($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $HSR20 = StringInStr($ModStruct, "00142828", 0, 1) ; Halves skill recharge of spells (Chance: 20%)
	If $HSR20 > 0 And ($t = 12) Then ; 12 is Forget Me Not, 22 is Wand Wrapping of Memory
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModHSR10($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $HSR10 = StringInStr($ModStruct, "000AA823", 0, 1) ; Halves skill recharge of spells (Chance: 10%)
	If $HSR10 > 0 And $t = 2 Or $t = 5 Or $t = 12 Or $t = 15 Or $t = 22 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then ; 2/5/15/27/32/35/36 are Let the Memory Live inscriptions, 12 is Serenity Now, 22 is Wand Wrapping of Quickening
		Return True
		Return False
	EndIf
EndFunc

;Focus Inscripts

Func IsNiceModHTTK($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $HailToTheKing = StringInStr($ModStruct, "0532A821", 0 ,1) ; Armor +5 (while Health is above 50%)
	If $HailToTheKing > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModFIMS($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $FaithIsMyShield = StringInStr($ModStruct, "05009821", 0 ,1) ; Armor +5 (while Enchanted)
	If $FaithIsMyShield > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModMMR($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $MightMakesRight = StringInStr($ModStruct, "05007821", 0 ,1) ; Armor +5 (while attacking)
	If $MightMakesRight > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModKIHTB($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $KnowingIsHalfTheBattle = StringInStr($ModStruct, "05008821", 0 ,1) ; Armor +5 (while casting)
	If $KnowingIsHalfTheBattle >0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModMFAS($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ManForAllSeasons = StringInStr($ModStruct, "05002821", 0 ,1) ; Armor +5 (vs Elemental damage)
	If $ManForAllSeasons > 0 And $t = 12 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModSOTF($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $SurvivalOfTheFittest = StringInStr($ModStruct, "05005821", 0 ,1) ; Armor +5 (vs Physical damage)
	If $SurvivalOfTheFittest > 0 And $t = 12 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModIIB($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ArmorAlways = StringInStr($ModStruct, "05000821", 0 ,1) ; Armor +5
Local $EnergyMinus5 = StringInStr($ModStruct, "0500B820", 0 ,1) ; Energy -5
	If ($ArmorAlways > 0 And $EnergyMinus5 > 0) Then ; Ignorance Is Bliss
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModLIP($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ArmorAlways = StringInStr($ModStruct, "05000821", 0 ,1) ; Armor +5
Local $LifeIsPain = StringInStr($ModStruct, "1400D820", 0 ,1) ; Health -20
	If ($ArmorAlways > 0 And $LifeIsPain > 0) Then ; Life Is Pain
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModDBNO($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $DownButNotOut = StringInStr($ModStruct, "0A32B821", 0 ,1) ; Armor +10 (while Health is below 50%)
	If $DownButNotOut > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModBJAFN($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $BeJustAndFearNot = StringInStr($ModStruct, "0A00C821", 0 ,1) ; Armor +10 (while Hexed)
	If $BeJustAndFearNot > 0 Then
		Return True
		Return False
	EndIf
EndFunc

;Martial Mastery

Func IsNiceModAxeMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofAxemastery = StringInStr($ModStruct, "14121824", 0 ,1) ; Axe Mastery +1 (20% chance while using skills)
	If $ofAxemastery > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModBowMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofMarkmanship = StringInStr($ModStruct, "14191824", 0 ,1) ; Marksmanship +1 (20% chance while using skills)
	If $ofMarkmanship > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModDagMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofDaggermastery = StringInStr($ModStruct, "141D1824", 0 ,1) ; Dagger Mastery +1 (20% chance while using skills)
	If $ofDaggermastery > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModHamMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofHammermastery = StringInStr($ModStruct, "14131824", 0 ,1) ; Hammer Mastery +1 (20% chance while using skills)
	If $ofHammermastery > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModScytheMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofScythemastery = StringInStr($ModStruct, "14291824", 0 ,1) ; Scythe Mastery +1 (20% chance while using skills)
	If $ofScythemastery > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModSpearMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofSpearMastery = StringInStr($ModStruct, "14251824", 0 ,1) ; Spear Mastery +1 (20% chance while using skills)
	If $ofSpearMastery > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModSwordMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofSwordmanship = StringInStr($ModStruct, "14141824", 0 ,1) ; Swordmanship +1 (20% chance while using skills)
	If $ofSwordmanship > 0 Then
		Return True
		Return False
	EndIf
EndFunc

;Staff/Offhand/Shield Inscripts and Mods


Func IsNiceMod45HPStance($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofEndurance = StringInStr($ModStruct, "002D8823", 0 ,1) ; +45 Health while in a Stance
	If $ofEndurance > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; 12 is Focus core, 24 is shield handle, 26 is staff wrapping
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceMod60HPHex($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofValor = StringInStr($ModStruct, "003C7823", 0 ,1) ; +60 Health while Hexed
	If $ofValor > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; 12 is Focus core, 24 is shield handle, 26 is staff wrapping
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModMOMD($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $MasterOfMyDomain = StringInStr($ModStruct, "00143828", 0 ,1) ; Item's attribute +1 (Chance: 20%)
	If $MasterOfMyDomain > 0 Then
		Return True
		Return False
	EndIf
EndFunc

;OS Shields, Staff Wrappings, and Offhands

Func IsNiceModIllMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofIllusionMagic = StringInStr($ModStruct, "14011824", 0 ,1) ; Illusion Magic +1 (20% chance while using skills)
	If $ofIllusionMagic > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModDomMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofDominationMagic = StringInStr($ModStruct, "14021824", 0 ,1) ; Domination Magic +1 (20% chance while using skills)
	If $ofDominationMagic > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModInspMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofInspiration = StringInStr($ModStruct, "14031824", 0 ,1) ; Inspiration  +1 (20% chance while using skills)
	If $ofInspiration > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModBloodMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofBloodMagic = StringInStr($ModStruct, "14041824", 0 ,1) ; Blood Magic +1 (20% chance while using skills)
	If $ofBloodMagic > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModDeathMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofDeathmagic = StringInStr($ModStruct, "14051824", 0 ,1) ; Death Magic +1 (20% chance while using skills)
	If $ofDeathmagic > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModSoulMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofSoulReaping = StringInStr($ModStruct, "14061824", 0 ,1) ; Soul Reaping +1 (20% chance while using skills)
	If $ofSoulReaping > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModCurseMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofCursemagic = StringInStr($ModStruct, "14071824", 0 ,1) ; Curse Magic +1 (20% chance while using skills)
	If $ofCursemagic > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModAirMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofAirMagic = StringInStr($ModStruct, "14081824", 0 ,1) ; Air Magic +1 (20% chance while using skills)
	If $ofAirMagic > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModEarthMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofEarthMagic = StringInStr($ModStruct, "14091824", 0 ,1) ; Earth Magic +1 (20% chance while using skills)
	If $ofEarthMagic > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModFireMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofFiremagic = StringInStr($ModStruct, "140A1824", 0 ,1) ; Fire Magic +1 (20% chance while using skills)
	If $ofFiremagic > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModWaterMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofWaterMagic = StringInStr($ModStruct, "140B1824", 0 ,1) ; Water Magic +1 (20% chance while using skills)
	If $ofWaterMagic > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModHealMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofHealingPrayers = StringInStr($ModStruct, "140D1824", 0 ,1) ; Healing Prayers +1 (20% chance while using skills)
	If $ofHealingPrayers > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModSmiteMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofSmitingPrayers = StringInStr($ModStruct, "140E1824", 0 ,1) ; Smiting Prayers +1 (20% chance while using skills)
	If $ofSmitingPrayers > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModProtMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofProtectionPrayers = StringInStr($ModStruct, "140F1824", 0 ,1) ; Protection Prayers +1 (20% chance while using skills)
	If $ofProtectionPrayers > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModDivineMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofDivineFavor = StringInStr($ModStruct, "14101824", 0 ,1) ; Divine Favor  +1 (20% chance while using skills)
	If $ofDivineFavor > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModCommMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofCommuningMagic = StringInStr($ModStruct, "14201824", 0 ,1) ; Communing Magic +1 (20% chance while using skills)
	If $ofCommuningMagic > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModRestoMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofRestorationMagic = StringInStr($ModStruct, "14211824", 0 ,1) ; Restoration Magic +1 (20% chance while using skills)
	If $ofRestorationMagic > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModChannMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofChannelingMagic = StringInStr($ModStruct, "14221824", 0 ,1) ; Channeling Magic +1 (20% chance while using skills)
	If $ofChannelingMagic > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModSpawnMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofSpawningMagic = StringInStr($ModStruct, "14241824", 0 ,1) ; Spawning Magic +1 (20% chance while using skills)
	If $ofSpawningMagic > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; Offhand, Shield, Staff
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModStaffMastery($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")
	
Local $StaffMastery  = StringInStr($ModStruct, "00143828", 0 ,1) ; Mastery Staff Wrapping
	If $StaffMastery  > 0 And ($t = 26) Then ; 26 is Staff Wrapping
		Return True
		Return False
	EndIf
EndFunc

;Offhand and Shield Only

;OS Shield and Offhand Mods

Func IsNiceModARUndead($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ArmorVsUndead = StringInStr($ModStruct, "0A004821", 0 ,1)					; +10 Armor vs Undead
	If $ArmorVsUndead > 0 And ($t = 12 Or $t = 24) Then ; Offhand, Shield
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModARCharr($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ArmorVsCharr = StringInStr($ModStruct, "0A014821", 0 ,1)						; +10 Armor vs Charr
	If $ArmorVsCharr > 0 And ($t = 12 Or $t = 24) Then ; Offhand, Shield
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModARTroll($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ArmorVsTrolls = StringInStr($ModStruct, "0A024821", 0 ,1)					; +10 Armor vs Trolls
	If $ArmorVsTrolls > 0 And ($t = 12 Or $t = 24) Then ; Offhand, Shield
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModARPlants($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ArmorVsPlants = StringInStr($ModStruct, "0A034821", 0 ,1)					; +10 Armor vs Plants
	If $ArmorVsPlants > 0 And ($t = 12 Or $t = 24) Then ; Offhand, Shield
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModARSkele($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ArmorVsSkeletons = StringInStr($ModStruct, "0A044821", 0 ,1)					; +10 Armor vs Skeletons
	If $ArmorVsSkeletons > 0 And ($t = 12 Or $t = 24) Then ; Offhand, Shield
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModARGiants($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ArmorVsGiants = StringInStr($ModStruct, "0A054821", 0 ,1)					; +10 Armor vs Giants
	If $ArmorVsGiants > 0 And ($t = 12 Or $t = 24) Then ; Offhand, Shield
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModARDwarves($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ArmorVsDwarves = StringInStr($ModStruct, "0A064821", 0 ,1)					; +10 Armor vs Dwarves
	If $ArmorVsDwarves > 0 And ($t = 12 Or $t = 24) Then ; Offhand, Shield
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModARTengu($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ArmorVsTengu = StringInStr($ModStruct, "0A074821", 0 ,1)						; +10 Armor vs Tengu
	If $ArmorVsTengu > 0 And ($t = 12 Or $t = 24) Then ; Offhand, Shield
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModARDemons($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ArmorVsDragons = StringInStr($ModStruct, "0A094821", 0 ,1)					; +10 Armor vs Dragons
	If $ArmorVsDragons > 0 And ($t = 12 Or $t = 24) Then ; Offhand, Shield
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModAROgres($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ArmorVsOgres = StringInStr($ModStruct, "0A0A4821", 0 ,1)						; +10 Armor vs Ogres
	If $ArmorVsOgres > 0 And ($t = 12 Or $t = 24) Then ; Offhand, Shield
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModARDragons($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ArmorVsDemons = StringInStr($ModStruct, "0A084821", 0 ,1)					; +10 Armor vs Demons
	If $ArmorVsDemons > 0 And ($t = 12 Or $t = 24) Then ; Offhand, Shield
		Return True
		Return False
	EndIf
EndFunc
;End OS SHIELDS AND OFFHANDS

;Normal Shield and Offhand Inscripts and Mods

Func IsNiceModPierce($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

     Local $ThroughThickAndThin = StringInStr($ModStruct, "0A0118A1", 0 ,1) ; Armor +10 (vs Piercing damage)
         If $ThroughThickAndThin > 0 Then
           Return True
           Return False
      EndIf
EndFunc

Func IsNiceModEarth($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

     Local $LikeARollingStone = StringInStr($ModStruct, "0A0B18A1", 0 ,1) ; Armor +10 (vs Earth damage)
         If $LikeARollingStone > 0 Then
             Return True
             Return False
         EndIf
EndFunc

Func IsNiceModCold($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

     Local $LeafOnTheWind = StringInStr($ModStruct, "0A0318A1", 0 ,1) ; Armor +10 (vs Cold damage)
         If $LeafOnTheWind > 0 Then
             Return True
             Return False
         EndIf
EndFunc

Func IsNiceModFire($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

     Local $SleepNowInTheFire = StringInStr($ModStruct, "0A0518A1", 0 ,1) ; Armor +10 (vs Fire damage)
         If $SleepNowInTheFire > 0 Then
             Return True
             Return False
         EndIf
EndFunc

Func IsNiceModLightning($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

     Local $RidersOnTheStorm = StringInStr($ModStruct, "0A0418A1", 0 ,1) ; Armor +10 (vs Lightning damage)
         If $RidersOnTheStorm > 0 Then
             Return True
             Return False
         EndIf
EndFunc

Func IsNiceModBlunt($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

     Local $NotTheFace = StringInStr($ModStruct, "0A0018A1", 0 ,1) ; Armor +10 (vs Blunt damage)
         If $NotTheFace > 0 Then
             Return True
             Return False
     EndIf
EndFunc

Func IsNiceModSlashing($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

     Local $TheRiddleOfSteel = StringInStr($ModStruct, "0A0218A1", 0 ,1) ; Armor +10 (vs Slashing damage)
         If $TheRiddleOfSteel > 0 Then
             Return True
             Return False
         EndIf
EndFunc


Func IsNiceModSBF($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ShelteredByFaith = StringInStr($ModStruct, "02008820", 0 ,1) ; Received physical damage -2 (while Enchanted)
	If $ShelteredByFaith > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModRFYL($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $RunForYourLife = StringInStr($ModStruct, "0200A820", 0 ,1) ; Received physical damage -2 (while in a Stance)
	If $RunForYourLife > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModNTF($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $NothingToFear = StringInStr($ModStruct, "03009820", 0 ,1) ; Received physical damage -3 (while Hexed)
	If $NothingToFear > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModLOTD($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $LuckOfTheDraw = StringInStr($ModStruct, "05147820", 0 ,1) ; Received physical damage -5 (Chance: 20%)
	If $LuckOfTheDraw > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModFCD($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $FearCutsDeeper = StringInStr($ModStruct, "00005828", 0 ,1) ; Reduces Bleeding duration on you by 20%
	If $FearCutsDeeper > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModSOB($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $StrengthOfBody = StringInStr($ModStruct, "00045828", 0 ,1) ; Reduces Deep Wound duration on you by 20%
	If $StrengthOfBody > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModCOTU($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $CastOutTheUnclean = StringInStr($ModStruct, "00055828", 0 ,1) ; Reduces Disease duration on you by 20% ; Inscribable
Local $CastOutTheUncleanOS = StringInStr($ModStruct, "E3017824", 0, 1) ; Reduces Disease duration on you by 20% ; OS shield/staff/offhand
If $CastOutTheUnclean > 0 Then
		Return True
		Return False
	EndIf
	If $CastOutTheUncleanOS > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModPoison($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $PureOfHeart = StringInStr($ModStruct, "00065828", 0 ,1) ; Reduces Poison duration on you by 20%
	If $PureOfHeart > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModWeak($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $OnlyTheStrongSurvive = StringInStr($ModStruct, "00085828", 0 ,1) ; Reduces Weakness duration on you by 20%
	If $OnlyTheStrongSurvive > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModBlind($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

	 Local $ICanSeeClearlyNow = StringInStr($ModStruct, "00015828", 0 ,1) ; Reduces Blind duration on you by 20%
         If $ICanSeeClearlyNow > 0 Then
             Return True
             Return False
         EndIf
EndFunc

Func IsNiceModCrip($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

     Local $SwiftAsTheWind = StringInStr($ModStruct, "00035828", 0 ,1) ; Reduces Crippled duration on you by 20%
         If $SwiftAsTheWind > 0 Then
             Return True
             Return False
         EndIf
EndFunc

Func IsNiceModDaze($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

     Local $SoundnessOfMind = StringInStr($ModStruct, "00075828", 0 ,1) ; Reduces Dazed duration on you by 20%
         If $SoundnessOfMind > 0 Then
             Return True
             Return False
         EndIf
EndFunc

;Random Extra Mods

Func IsNiceModShelter($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofShelter = StringInStr($ModStruct, "07005821", 0 ,1) ; +7 armor vs Physical
	If $ofShelter > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then ; 26 is Staff Wrapping
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModM4M($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $MeasureForMeasure = StringInStr($ModStruct, "1D000826", 0 ,1) ; Highly salvageable
	If $MeasureForMeasure > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModSMTM($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ShowMeTheMoney = StringInStr($ModStruct, "3200F805", 0 ,1) ; Improved sale value
	If $ShowMeTheMoney > 0 Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModCharrSlaying($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofCharrslaying = StringInStr($ModStruct, "00018080", 0 ,1) ; Damge 20% (vs Charr)
	If $ofCharrslaying > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModTrollslaying($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofTrollslaying = StringInStr($ModStruct, "00028080", 0 ,1) ; Damge 20% (vs Trolls)
	If $ofTrollslaying > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModPruning($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")
	
Local $ofPruning = StringInStr($ModStruct, "00038080", 0 ,1) ; Damge 20% (vs Plants)
	If $ofPruning > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModSkeletonslaying($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofSkeletonslaying = StringInStr($ModStruct, "00048080", 0 ,1) ; Damge 20% (vs Skeletons)
	If $ofSkeletonslaying > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModGiantslaying($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofGiantslaying = StringInStr($ModStruct, "00058080", 0 ,1) ; Damge 20% (vs Giants)
	If $ofGiantslaying > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModDwarfslaying($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofDwarfslaying = StringInStr($ModStruct, "00068080", 0 ,1) ; Damge 20% (vs Dwarves)
	If $ofDwarfslaying > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModTenguslaying($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofTenguslaying = StringInStr($ModStruct, "00078080", 0 ,1) ; Damge 20% (vs Tengu)
	If $ofTenguslaying > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModDemonslaying($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofDemonslaying = StringInStr($ModStruct, "00088080", 0 ,1) ; Damge 20% (vs Demons)
	If $ofDemonslaying > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModDragonslaying($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofDragonslaying = StringInStr($ModStruct, "00098080", 0 ,1) ; Damge 20% (vs Dragons)
	If $ofDragonslaying > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27) Then
		Return True
		Return False
	EndIf
EndFunc

Func IsNiceModOgreslaying($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

Local $ofOgreslaying = StringInStr($ModStruct, "000A8080", 0 ,1) ; Damge 20% (vs Ogres)
	If $ofOgreslaying > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27) Then
		Return True
		Return False
	EndIf
EndFunc


;End Mods


Func IsNiceMod($aItem)
    Local $ModStruct = GetModStruct($aItem)
    Local $t         = DllStructGetData($aItem, "Type")

    Local $ArmorAlways = StringInStr($ModStruct, "05000821", 0 ,1) ; Armor +5
        If $ArmorAlways > 0 And ($t = 36) Then ; 26 is Staff Head or Wrapping
            Return True
            Return False
        EndIf
    
    Local $FuriousPrefix = StringInStr($ModStruct, "0A00B823", 0 ,1) ; Axe haft, Dagger Tang, Hammer Haft, Scythe Snathe, Spearhead, Sword Hilt
       If $FuriousPrefix > 0 And ($t = 36) Then
            Return True
            Return False
    EndIf
	
	Local $ZealousPrefix = StringInStr($ModStruct, "01001825", 0 ,1) ; Axe haft, Bow String, Dagger Tang, Hammer Haft, Scythe Snathe, Spearhead, Sword Hilt
	If $ZealousPrefix > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then
		Return True
		Return False
	EndIf
	
	Local $ofDeathbane = StringInStr($ModStruct, "00008080", 0 ,1) ; Damge 20% (vs Undead)
	If $ofDeathbane > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27) Then
		Return True
		Return False
	EndIf
	
	Local $Vampiric5Prefix = StringInStr($ModStruct, "00052825", 0 ,1) ; Bow String, Hammer Haft, Scythe Snathe
	If $Vampiric5Prefix > 0 And ($t = 5 Or $t = 15 Or $t = 35) Then
		Return True
		Return False
	EndIf
	
	Local $Vampiric3Prefix = StringInStr($ModStruct, "00032825", 0 ,1) ; Axe Haft, Dagger Tang, Spearhead, Sword Hilt
	If $Vampiric3Prefix > 0 And ($t = 2 Or $t = 27 Or $t = 32 Or $t = 36) Then
		Return True
		Return False
	EndIf
	
	Local $ofEnchanting = StringInStr($ModStruct, "1400B822", 0 ,1) ; +20% Enchantment Duration
	If $ofEnchanting > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then ; 26 is Staff Wrapping
		Return True
		Return False
	EndIf
	
	Local $ofWarding = StringInStr($ModStruct, "07002821", 0 ,1) ; +7 Armor vs Elemental
	If $ofWarding > 0 And ($t = 2 Or $t = 5 Or $t = 15 Or $t = 26 Or $t = 27 Or $t = 32 Or $t = 35 Or $t = 36) Then ; 26 is Staff Wrapping
		Return True
		Return False
	EndIf

    Local $HealthAlways = StringInStr($ModStruct, "001E4823", 0 ,1) ; +30 Health
        If $HealthAlways > 0 And ($t = 24 Or $t = 27 Or $t = 36) Then ; 12 is focus core, 26 can be Staff Head or Wrap
            Return True
            Return False
        EndIf
		
	Local $ofDevotion = StringInStr($ModStruct, "002D6823", 0 ,1) ; +45 Health while Enchanted
	If $ofDevotion > 0 And ($t = 12 Or $t = 24 Or $t = 26) Then ; 12 is Focus core, 24 is shield handle, 26 is staff wrapping
		Return True
		Return False
	EndIf	


    ; +10 armor vs type
     Local $NotTheFace = StringInStr($ModStruct, "0A0018A1", 0 ,1) ; Armor +10 (vs Blunt damage)
         If $NotTheFace > 0 Then
             Return True
             Return False
     EndIf
     Local $LeafOnTheWind = StringInStr($ModStruct, "0A0318A1", 0 ,1) ; Armor +10 (vs Cold damage)
         If $LeafOnTheWind > 0 Then
             Return True
             Return False
         EndIf
     Local $LikeARollingStone = StringInStr($ModStruct, "0A0B18A1", 0 ,1) ; Armor +10 (vs Earth damage)
         If $LikeARollingStone > 0 Then
             Return True
             Return False
         EndIf
     Local $SleepNowInTheFire = StringInStr($ModStruct, "0A0518A1", 0 ,1) ; Armor +10 (vs Fire damage)
         If $SleepNowInTheFire > 0 Then
             Return True
             Return False
         EndIf
     Local $RidersOnTheStorm = StringInStr($ModStruct, "0A0418A1", 0 ,1) ; Armor +10 (vs Lightning damage)
         If $RidersOnTheStorm > 0 Then
             Return True
             Return False
         EndIf
     Local $ThroughThickAndThin = StringInStr($ModStruct, "0A0118A1", 0 ,1) ; Armor +10 (vs Piercing damage)
         If $ThroughThickAndThin > 0 Then
             Return True
             Return False
         EndIf
     Local $TheRiddleOfSteel = StringInStr($ModStruct, "0A0218A1", 0 ,1) ; Armor +10 (vs Slashing damage)
         If $TheRiddleOfSteel > 0 Then
             Return True
             Return False
         EndIf

     ;reduce blind dazed cripple -33%
	 
	 Local $ICanSeeClearlyNow = StringInStr($ModStruct, "00015828", 0 ,1) ; Reduces Blind duration on you by 20%
         If $ICanSeeClearlyNow > 0 Then
             Return True
             Return False
         EndIf
     Local $SwiftAsTheWind = StringInStr($ModStruct, "00035828", 0 ,1) ; Reduces Crippled duration on you by 20%
         If $SwiftAsTheWind > 0 Then
             Return True
             Return False
         EndIf
     Local $SoundnessOfMind = StringInStr($ModStruct, "00075828", 0 ,1) ; Reduces Dazed duration on you by 20%
         If $SoundnessOfMind > 0 Then
             Return True
             Return False
         EndIf
    ; 40/40 mods
    Local $HCT20 = StringInStr($ModStruct, "00140828", 0 ,1) ; Halves casting time of spells of item's attribute (Chance: 20%)
        If $HCT20 > 0 And ($t = 12 Or $t = 22 Or $t = 26) Then; 12 is Focus core of aptitude, 22 is Inscription Aptitude Not Attitude, 26 is Inscription or Adept Staff head
            Return True
            Return False
        EndIf

    Local $HSR20 = StringInStr($ModStruct, "00142828", 0, 1) ; Halves skill recharge of spells (Chance: 20%)
        If $HSR20 > 0 And ($t = 12 Or $t = 22) Then ; 12 is Forget Me Not, 22 is Wand Wrapping of Memory
            Return True
            Return False
        EndIf

    Return False

EndFunc






; Axe (Type 2)
; Bow (Type 5)
; Runes (Type 8)
; Offhand (Type 12)
; Hammer (Type 15)
; Wand (Type 22)
; Shield (Type 24)
; Staff (Type 26)
; Sword (Type 27)
; Dagger  (Type 32)
; Scythe (Type 35)
; Spear (Type 36)
