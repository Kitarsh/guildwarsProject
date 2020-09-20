Global const $necromancerRangerPresearingBuild = _ ; Skill bar code : OABDQapWGTJNZaOth2+WAA
    [ _
        83, _ ; = Animate Bone Horror
        105, _ ; = Deathly Swarn 
        153, _ ; = Vampiric Gaze
        115, _ ; = Blood Renewal
        109, _ ; = Life Siphon
        436, _ ; = Comfort Animal
        446, _ ; = Troll Unguent
        2 _ ; = Ressurection Signet
    ]

Global const $assassinDaggerBuild = _ ; Skill bar code : OwBj0tf44OOMG2BbAeAJgxZ9HA
    [ _
        782, _ ; = Jagged Strike
        780, _ ; = Fox Fangs
        775, _ ; = Death Blossom
        1027, _ ; = Critical Defenses
        1031, _ ; = Shroud of Distress
        1028, _ ; = Way of Perfection
        1649, _ ; = Way of the Assassin
        1018 _ ; = Critical Eye
    ]


Global $fightingPatternToUse = ""

; Description : Select the fighting pattern based on player's current build.
Func SkillsBar_LoadFightingPattern()
    If SkillsBar_IsNRPresearing() Then $fightingPatternToUse = "NRPresearing"
    If SkillsBar_IsAssaDagger() Then $fightingPatternToUse = "ADaggers"
    ;~ If $fightingPatternToUse == "" Then Exit
EndFunc ;~ Fight_LoadFightingPattern
 
; Description : Test if the build equipped is the Necro/Ranger for Presearing.
Func SkillsBar_IsNRPresearing()
    return SkillsBar_IsBuildEquipped($necromancerRangerPresearingBuild)
EndFunc ;~ SkillsBar_IsNRPresearing
 
; Description : Test if the build equipped is the Assassin with daggers.
Func SkillsBar_IsAssaDagger()
    return SkillsBar_IsBuildEquipped($assassinDaggerBuild)
EndFunc ;~ SkillsBar_IsNRPresearing

; Description : Test if the skills array is the build currently equiped by the player.
Func SkillsBar_IsBuildEquipped($build)
    For $i = 0 To UBound($build) - 1
        if Not(SkillsBar_IsSkillEquipped($build[$i], $i + 1)) then return false
    Next
    return true
EndFunc ;~ SkillsBar_IsNRPresearingBuild

; Description : Test if the skill is equipped by the player at the skill position
Func SkillsBar_IsSkillEquipped($skillId, $skillPosition)
    Local $equippedSkill = GetSkillbarSkillID($skillPosition)
    Local $test = $equippedSkill == $skillId
    InitGUI_LogIntoGUIConsole("Testing Skill " & $skillPosition & " : " & $test)
    If (Not($test)) Then
        InitGUI_LogIntoGUIConsole("Got this idSkill in player bar : " & $equippedSkill)
        InitGUI_LogIntoGUIConsole("Was supposed to be this id : " & $skillId)
    EndIf
    return $test
EndFunc ;~ SkillsBar_IsSkillEquipped