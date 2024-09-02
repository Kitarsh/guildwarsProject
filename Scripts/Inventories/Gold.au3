Func Gold_Store()
    Local $lGoldCharacter = GetGoldCharacter()
    If $lGoldCharacter >= 10000 Then
        Local $lDepositAmount = Floor($lGoldCharacter / 10000) * 10000
        DepositGold($lDepositAmount)
    EndIf
EndFunc

Func Count_Item($itemID = 0)
    Local $totalQuantity = 0
    For $iBag = 1 To 4
        Local $lBag = GetBag($iBag)
        Local $lNumberSlots = DllStructGetData($lBag, 'Slots')
        For $iSlot = 1 To $lNumberSlots
            Local $lItem = GetItemBySlot($iBag, $iSlot)
            Local $lIdItem = DllStructGetData($lItem, 'ID')
            If $lIdItem == 0 Then ContinueLoop
            
            Local $lModelId = DllStructGetData($lItem, 'ModelID')
            If ($lModelId == $itemID) Then
                Local $lQuantity = DllStructGetData($lItem, 'Quantity')
                $totalQuantity = $totalQuantity + $lQuantity
            EndIf
        Next
    Next
    Return $totalQuantity
EndFunc; Count_GraniteSlab