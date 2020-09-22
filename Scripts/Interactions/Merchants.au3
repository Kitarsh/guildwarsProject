Func Merchants_SellMat($idMat, $count)
    Local $failure = 0
    For $i = 0 To $count - 1
        Sleep(100 + 2 * GetPing())
        Local $successRequest = TraderRequestSell($idMat)
        Sleep(100 + 2 * GetPing())
        If $successRequest Then
            Local $successTrade = TraderSell()
        EndIf
        If Not($successRequest and $successTrade) Then
            $failure += 1
        EndIf
    Next
    return $failure
EndFunc ; Merchants_SellMat

Func Merchants_BuyMat($idMat, $count)
    Local $failure = 0
    For $i = 0 To $count - 1
        Sleep(100 + 2 * GetPing())
        Local $successRequest = TraderRequest($idMat)
        Sleep(100 + 2 * GetPing())
        If $successRequest Then
            Local $successTrade = TraderBuy()
        EndIf
        If Not($successRequest and $successTrade) Then
            $failure += 1
        EndIf
    Next
    return $failure
EndFunc ;  Merchants_BuyMat