; Sells items in bags 1 and 2
Global Const $FirstBagToSell = 1
Global Const $LastBagToSell = 2

Func Sell_WeaponsInInventory()
    For $iBag = $FirstBagToSell To $LastBagToSell
        Local $lBag = GetBag($iBag)
        IdentifyBag($lBag)
        Local $lNumberSlots = DllStructGetData($lBag, 'Slots')
        For $iSlot = 1 To $lNumberSlots
            Local $lItem = GetItemBySlot($iBag, $iSlot)
            If DllStructGetData($lItem, 'ID') == 0 Then ContinueLoop
            If GetItemReq($lItem) == "" Then ContinueLoop
            Merchants_SellItem($iBag, $iSlot)
        Next
    Next
EndFunc ; Sell_WeaponsInInventory

Func Sell_CommonMatInInventory()
    For $iBag = $FirstBagToSell To $LastBagToSell
        Local $lBag = GetBag($iBag)
        Local $lNumberSlots = DllStructGetData($lBag, 'Slots')
        For $iSlot = 1 To $lNumberSlots
            Local $lItem = GetItemBySlot($iBag, $iSlot)
            Local $lIdItem = DllStructGetData($lItem, 'ID')
            If $lIdItem == 0 Then ContinueLoop
            
            Local $lModelId = DllStructGetData($lItem, 'ModelID')
            If Not(Array_Contains($lModelId, $Array_Item_CommonMat)) Then ContinueLoop
            
            Local $lQuantity = DllStructGetData($lItem, 'Quantity')
            If $lQuantity < 10 Then ContinueLoop

            Merchants_SellMat($lIdItem, Floor($lQuantity / 10))
        Next
    Next
EndFunc ; Sell_CommonMatInInventory

Func Sell_RareMatInInventory()
    For $iBag = $FirstBagToSell To $LastBagToSell
        Local $lBag = GetBag($iBag)
        Local $lNumberSlots = DllStructGetData($lBag, 'Slots')
        For $iSlot = 1 To $lNumberSlots
            Local $lItem = GetItemBySlot($iBag, $iSlot)
            Local $lIdItem = DllStructGetData($lItem, 'ID')
            If $lIdItem == 0 Then ContinueLoop
            
            Local $lModelId = DllStructGetData($lItem, 'ModelID')
            If Not(Array_Contains($lModelId, $Array_Item_RareMat)) Then ContinueLoop
            
            Local $lQuantity = DllStructGetData($lItem, 'Quantity')
            If $lQuantity < 10 Then ContinueLoop

            Merchants_SellMat($lIdItem, $lQuantity)
        Next
    Next
EndFunc ; Sell_RareMatInInventory