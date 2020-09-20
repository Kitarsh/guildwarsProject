;~ Log file
#include "../../../Start/Start.au3"
Local $processId = ProcessExists("gw.exe")
MemoryOpen($processId)
While 1
    TravelTo(39)
    MoveTo(-6190, -174)
    SwitchMode(1)
    Move(-4747, -65)
    WaitMapLoading()

    MoveTo(-2381, 2355)
    MoveTo(-188, 3308)
    Fight_FightingPattern()
        If GetIsDead(-2) Then ContinueLoop
    Target_PickUpLoot()
        If GetIsDead(-2) Then ContinueLoop

    MoveTo(1292, 5392)
    Fight_FightingPattern()
        If GetIsDead(-2) Then ContinueLoop
    Target_PickUpLoot()
        If GetIsDead(-2) Then ContinueLoop

    MoveTo(4150, 5056)
    Fight_FightingPattern()
        If GetIsDead(-2) Then ContinueLoop
    Target_PickUpLoot()
        If GetIsDead(-2) Then ContinueLoop

    MoveTo(6983, 8521)
    MoveTo(5038, 10341)
    Fight_FightingPattern()
        If GetIsDead(-2) Then ContinueLoop
    Target_PickUpLoot()
        If GetIsDead(-2) Then ContinueLoop

    MoveTo(3412, 11467)
    Fight_FightingPattern()
        If GetIsDead(-2) Then ContinueLoop
    Target_PickUpLoot()
        If GetIsDead(-2) Then ContinueLoop

    MoveTo(2571, 14191)
    Fight_FightingPattern()
        If GetIsDead(-2) Then ContinueLoop
    Target_PickUpLoot()
        If GetIsDead(-2) Then ContinueLoop

    MoveTo(1200, 13434)
    Fight_FightingPattern()
        If GetIsDead(-2) Then ContinueLoop
    Target_PickUpLoot()
        If GetIsDead(-2) Then ContinueLoop

    MoveTo(-1058, 11413)
    Fight_FightingPattern()
        If GetIsDead(-2) Then ContinueLoop
    Target_PickUpLoot()
        If GetIsDead(-2) Then ContinueLoop

    MoveTo(-2856, 13483)
    Fight_FightingPattern()
        If GetIsDead(-2) Then ContinueLoop
    Target_PickUpLoot()
        If GetIsDead(-2) Then ContinueLoop

    MoveTo(-5510, 14430)
    Fight_FightingPattern()
        If GetIsDead(-2) Then ContinueLoop
    Target_PickUpLoot()
        If GetIsDead(-2) Then ContinueLoop

    MoveTo(-4786, 10490)
    Fight_FightingPattern()
        If GetIsDead(-2) Then ContinueLoop
    Target_PickUpLoot()
        If GetIsDead(-2) Then ContinueLoop

    MoveTo(-5537, 7758)
    Fight_FightingPattern()
        If GetIsDead(-2) Then ContinueLoop
    Target_PickUpLoot()
        If GetIsDead(-2) Then ContinueLoop
WEnd
MemoryClose()
$mGWProcHandle = 0
Exit
