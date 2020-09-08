Local $idSkill1_Btn
Local $idSkill2_Btn
Local $idSkill3_Btn
Local $idSkill4_Btn
Local $idSkill5_Btn
Local $idSkill6_Btn
Local $idSkill7_Btn
Local $idSkill8_Btn

Func SkillsGUI_InitSkillsBtn()
    ;~ Create the Skill 1 button
    $idSkill1_Btn = GUICtrlCreateButton("1", 10, 310, 50, 50)

    ;~ Create the Skill 2 button
    $idSkill2_Btn = GUICtrlCreateButton("2", 70, 310, 50, 50)

    ;~ Create the Skill 3 button
    $idSkill3_Btn = GUICtrlCreateButton("3", 130, 310, 50, 50)

    ;~ Create the Skill 4 button
    $idSkill4_Btn = GUICtrlCreateButton("4", 190, 310, 50, 50)

    ;~ Create the Skill 5 button
    $idSkill5_Btn = GUICtrlCreateButton("5", 250, 310, 50, 50)

    ;~ Create the Skill 6 button
    $idSkill6_Btn = GUICtrlCreateButton("6", 310, 310, 50, 50)

    ;~ Create the Skill 7 button
    $idSkill7_Btn = GUICtrlCreateButton("7", 370, 310, 50, 50)

    ;~ Create the Skill 8 button
    $idSkill8_Btn = GUICtrlCreateButton("8", 430, 310, 50, 50)
EndFunc ;~ SkillsGUI_InitSkillsBtn