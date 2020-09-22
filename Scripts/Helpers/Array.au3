
Func Array_Contains($element, $array)
    For $i = 0 To Ubound($array) -1
        If $element = $array[$i] Then return true
    Next
    Return False
EndFunc ;~ ExistInArray

Func Array_IndexOf($element, $array)
    For $i = 0 To Ubound($array) -1
        If $element = $array[$i] then return $i
    Next
EndFunc ;~IndexOf