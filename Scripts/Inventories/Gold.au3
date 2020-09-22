Func Gold_Store()
    Local $lGoldCharacter = GetGoldCharacter()
    If $lGoldCharacter >= 10000 Then
        Local $lDepositAmount = Floor($lGoldCharacter / 10000) * 10000
        DepositGold($lDepositAmount)
    EndIf
EndFunc