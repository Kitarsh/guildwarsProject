#include "Includes.au3"
#include-once
$processId = ProcessExists("gw.exe")
Initialize($processId, True, True)
SkillsBar_LoadFightingPattern()
