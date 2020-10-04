#include "../../../Start/Start.au3"
Local $processId = ProcessExists("gw.exe")
MemoryOpen($processId)

Redim $TargetModelId_EnemiesToKill_Array[2] 
$TargetModelId_EnemiesToKill_Array[0] = 2440 ; Massif élémentaire
$TargetModelId_EnemiesToKill_Array[1] = 2405 ; Cobble Cogneroc

Redim $TargetModelId_EnemiesToAvoid_Array[3]
$TargetModelId_EnemiesToAvoid_Array[0] = 2404 ; Flint Toucheroc
$TargetModelId_EnemiesToAvoid_Array[1] = 2457 ; Grawl Ulodyte
$TargetModelId_EnemiesToAvoid_Array[1] = 2458 ; Grawl
While 1
    TravelTo(39)
    
    ; Talk To Chest
    MoveTo(-7274, -1514)
    GoToNPC(17)
    
    Gold_Store()
    
    ; Selling Weapons
    MoveTo(-6985, -387)
    GoToNPC(9)
    Sell_WeaponsInInventory()

    Gold_Store()

    MoveTo(-6190, -174)
    SwitchMode(1)
    Move(-4747, -65)
    WaitMapLoading()

    Local $runWaypoints = [ _
        [-188, 3308], _
        [1292, 5392], _
        [4150, 5056], _
        [6983, 8521], _
        [5038, 10341], _
        [3412, 11467], _
        [2571, 14191], _
        [1200, 13434], _
        [-1058, 11413], _
        [-2856, 13483], _
        [-5510, 14430], _
        [-4786, 10490], _
        [-5537, 7758] _
    ]

    Local $runState = 0
    For $i = 0 To UBound($runWaypoints) - 1
        $runState = Move_GoToAndFightThrough($runWaypoints[$i][0], $runWaypoints[$i][1], 0)
        If $runState == -1 Then ExitLoop
    Next
WEnd
MemoryClose()
$mGWProcHandle = 0
Exit
