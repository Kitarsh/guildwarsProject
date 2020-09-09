
Func ExistInArray($element, $array)
    For $i = 0 To Ubound($array) -1
        If $element = $array[$i] Then return true
    Next
EndFunc ;~ ExistInArray

Func IndexOf($element, $array)
    For $i = 0 To Ubound($array) -1
        If $element = $array[$i] then return $i
    Next
EndFunc ;~IndexOf