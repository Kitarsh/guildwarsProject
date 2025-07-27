#include-once

;Defaults
Global Enum $DIFFICULTY_NORMAL, $DIFFICULTY_HARD
Global Enum $INSTANCETYPE_OUTPOST, $INSTANCETYPE_EXPLORABLE, $INSTANCETYPE_LOADING
Global Enum $RANGE_ADJACENT=156, $RANGE_NEARBY=240, $RANGE_AREA=312, $RANGE_EARSHOT=1000, $RANGE_SPELLCAST = 1085, $RANGE_SPIRIT = 2500, $RANGE_COMPASS = 5000
Global Enum $RANGE_ADJACENT_2=156^2, $RANGE_NEARBY_2=240^2, $RANGE_AREA_2=312^2, $RANGE_EARSHOT_2=1000^2, $RANGE_SPELLCAST_2=1085^2, $RANGE_SPIRIT_2=2500^2, $RANGE_COMPASS_2=5000^2
Global Enum $PROF_NONE, $PROF_WARRIOR, $PROF_RANGER, $PROF_MONK, $PROF_NECROMANCER, $PROF_MESMER, $PROF_ELEMENTALIST, $PROF_ASSASSIN, $PROF_RITUALIST, $PROF_PARAGON, $PROF_DERVISH
Global Enum $ATTRIB_FastCasting, $ATTRIB_IllusionMagic, $ATTRIB_DominationMagic, $ATTRIB_InspirationMagic, _
			$ATTRIB_BloodMagic, $ATTRIB_DeathMagic, $ATTRIB_SoulReaping, $ATTRIB_Curses, _
			$ATTRIB_AirMagic, $ATTRIB_EarthMagic, $ATTRIB_FireMagic, $ATTRIB_WaterMagic, $ATTRIB_EnergyStorage, _
			$ATTRIB_HealingPrayers, $ATTRIB_SmitingPrayers, $ATTRIB_ProtectionPrayers, $ATTRIB_DivineFavor, _
			$ATTRIB_Strength, $ATTRIB_AxeMastery, $ATTRIB_HammerMastery, $ATTRIB_Swordsmanship, $ATTRIB_Tactics, _
			$ATTRIB_BeastMastery, $ATTRIB_Expertise, $ATTRIB_WildernessSurvival, $ATTRIB_Marksmanship, _
			$ATTRIB_DaggerMastery, $ATTRIB_DeadlyArts, $ATTRIB_ShadowArts, _
			$ATTRIB_Communing, $ATTRIB_RestorationMagic, $ATTRIB_ChannelingMagic, _
			$ATTRIB_CriticalStrikes, _
			$ATTRIB_SpawningPower, _
			$ATTRIB_SpearMastery, $ATTRIB_Command, $ATTRIB_Motivation, $ATTRIB_Leadership, _
			$ATTRIB_ScytheMastery, $ATTRIB_WindPrayers, $ATTRIB_EarthPrayers, $ATTRIB_Mysticism
Global $BAG_SLOTS[18] = [0, 20, 5, 10, 10, 20, 41, 12, 20, 20, 20, 20, 20, 20, 20, 20, 20, 9]

;Rarity
Global Const $RARITY_WHITE	= 2621
Global Const $RARITY_GRAY	= 2622
Global Const $RARITY_BLUE	= 2623
Global Const $RARITY_GOLD	= 2624
Global Const $RARITY_PURPLE	= 2626
Global Const $RARITY_GREEN	= 2627
Global Const $RARITY_RED	= 33026

;Type (see: http://wiki.gamerevision.com/index.php/Item_Type)
Global Const $TYPE_SALVAGE				= 0
Global Const $TYPE_LEADHAND				= 1
Global Const $TYPE_AXE					= 2
Global Const $TYPE_BAG					= 3
Global Const $TYPE_BOOTS				= 4
Global Const $TYPE_BOW					= 5
Global Const $TYPE_BUNDLE				= 6
Global Const $TYPE_CHESTPIECE			= 7
Global Const $TYPE_RUNE_AND_MOD			= 8
Global Const $TYPE_USABLE				= 9
Global Const $TYPE_DYE					= 10
Global Const $TYPE_MATERIAL_AND_ZCOINS	= 11
Global Const $TYPE_OFFHAND				= 12
Global Const $TYPE_GLOVES				= 13
Global Const $TYPE_CELESTIAL_SIGIL		= 14
Global Const $TYPE_HAMMER				= 15
Global Const $TYPE_HEADPIECE			= 16
Global Const $TYPE_TROPHY_2				= 17	; SalvageItem / CC Shards?
Global Const $TYPE_KEY					= 18
Global Const $TYPE_LEGGINS				= 19
Global Const $TYPE_GOLD_COINS			= 20
Global Const $TYPE_QUEST_ITEM			= 21
Global Const $TYPE_WAND					= 22
Global Const $TYPE_SHIELD				= 24
Global Const $TYPE_STAFF				= 26
Global Const $TYPE_SWORD				= 27
Global Const $TYPE_KIT					= 29	; + Keg Ale
Global Const $TYPE_TROPHY				= 30
Global Const $TYPE_SCROLL				= 31
Global Const $TYPE_DAGGERS				= 32
Global Const $TYPE_PRESENT				= 33
Global Const $TYPE_MINIPET				= 34
Global Const $TYPE_SCYTHE				= 35
Global Const $TYPE_SPEAR				= 36
Global Const $TYPE_BOOKS				= 43	; Encrypted Charr Battle Plan/Decoder, Golem User Manual, Books
Global Const $TYPE_COSTUME_BODY			= 44
Global Const $TYPE_COSTUME_HEADPICE		= 45
Global Const $TYPE_NOT_EQUIPPED			= 46

;Material
Global Const $MODEL_ID_BONES			= 921
Global Const $MODEL_ID_DUST				= 929
Global Const $MODEL_ID_IRON				= 948
Global Const $MODEL_ID_FEATHERS			= 933
Global Const $MODEL_ID_PLANT_FIBRES		= 934
Global Const $MODEL_ID_SCALES			= 953
Global Const $MODEL_ID_CHITIN			= 954
Global Const $MODEL_ID_GRANITE			= 955
Global Const $MODEL_ID_MONSTROUS_EYE	= 931
Global Const $MODEL_ID_MONSTROUS_FANG	= 932
Global Const $MODEL_ID_MONSTROUS_CLAW	= 923
Global Const $MODEL_ID_RUBY				= 937
Global Const $MODEL_ID_SAPPHIRE			= 938

;Kits
Global Const $MODEL_ID_CHEAP_SALVAGE_KIT	= 2992
Global Const $MODEL_ID_SALVAGE_KIT			= 5900
Global Const $MODEL_ID_CHEAP_ID_KIT			= 2989
Global Const $MODEL_ID_ID_KIT				= 5899
Global Const $model_id_superior_identification_kit			= 5899

;Scrolls
Global Const $MODEL_ID_UWSCROLL		= 3746
Global Const $MODEL_ID_FOWSCROLL	= 22280

;Misc
Global Const $MODEL_ID_GOLD_COINS	= 2511
Global Const $MODEL_ID_LOCKPICK		= 22751
Global Const $MODEL_ID_DYE			= 146
Global Const $EXTRA_ID_BLACK		= 10
Global Const $EXTRA_ID_WHITE		= 12

;Event
Global Const $MODEL_ID_TOTS					= 28434
Global Const $MODEL_ID_GOLDEN_EGGS			= 22752
Global Const $MODEL_ID_BUNNIES				= 22644
Global Const $MODEL_ID_GROG					= 30855
Global Const $MODEL_ID_SHAMROCK_ALE			= 22190
Global Const $MODEL_ID_CLOVER				= 22191
Global Const $MODEL_ID_PIE					= 28436
Global Const $MODEL_ID_CIDER				= 28435
Global Const $MODEL_ID_POPPERS				= 21810
Global Const $MODEL_ID_ROCKETS				= 21809
Global Const $MODEL_ID_CUPCAKES				= 22269
Global Const $MODEL_ID_SPARKLER				= 21813
Global Const $MODEL_ID_HONEYCOMB			= 26784
Global Const $MODEL_ID_VICTORY_TOKEN		= 18345
Global Const $MODEL_ID_LUNAR_TOKEN			= 21833
Global Const $MODEL_ID_HUNTERS_ALE			= 910
Global Const $MODEL_ID_PUMPKIN_COOKIE		= 28433
Global Const $MODEL_ID_KRYTAN_BRANDY		= 35124
Global Const $MODEL_ID_BLUE_DRINK			= 21812
Global Const $MODEL_ID_FRUITCAKE			= 21492
Global Const $MODEL_ID_SPIKED_EGGNOGG		= 6366
Global Const $MODEL_ID_EGGNOGG				= 6375
Global Const $MODEL_ID_SNOWMAN_SUMMONER		= 6376
Global Const $MODEL_ID_FROSTY_TONIC			= 30648
Global Const $MODEL_ID_MISCHIEVOUS_TONIC	= 31020
Global Const $MODEL_ID_DELICIOUS_CAKE		= 36681
Global Const $MODEL_ID_ICED_TEA				= 36682
Global Const $MODEL_ID_PARTY_BEACON			= 36683

;Tomes - E = ELITE | R = REGULAR
Global Const $MODEL_ID_TOME_E_SIN		= 21786
Global Const $MODEL_ID_TOME_E_MES		= 21787
Global Const $MODEL_ID_TOME_E_NEC		= 21788
Global Const $MODEL_ID_TOME_E_ELE		= 21789
Global Const $MODEL_ID_TOME_E_MONK		= 21790
Global Const $MODEL_ID_TOME_E_WAR		= 21791
Global Const $MODEL_ID_TOME_E_RANGER	= 21792
Global Const $MODEL_ID_TOME_E_DERV		= 21793
Global Const $MODEL_ID_TOME_E_RIT		= 21794
Global Const $MODEL_ID_TOME_E_PARA		= 21795
Global Const $MODEL_ID_TOME_R_SIN		= 21796
Global Const $MODEL_ID_TOME_R_MES		= 21797
Global Const $MODEL_ID_TOME_R_NEC		= 21798
Global Const $MODEL_ID_TOME_R_ELE		= 21799
Global Const $MODEL_ID_TOME_R_MONK		= 21800
Global Const $MODEL_ID_TOME_R_WAR		= 21801
Global Const $MODEL_ID_TOME_R_RANGER	= 21802
Global Const $MODEL_ID_TOME_R_DERV		= 21803
Global Const $MODEL_ID_TOME_R_RIT		= 21804
Global Const $MODEL_ID_TOME_R_PARA		= 21805

;Conditions
Global Const $EFFECT_ID_BLEEDING	= 478
Global Const $EFFECT_ID_BLIND		= 479
Global Const $EFFECT_ID_BURNING		= 480
Global Const $EFFECT_ID_CRIPPLED	= 481
Global Const $EFFECT_ID_DEEP_WOUND	= 482
Global Const $EFFECT_ID_DISEASE		= 483
Global Const $EFFECT_ID_POISON		= 484
Global Const $EFFECT_ID_DAZED		= 485
Global Const $EFFECT_ID_WEAKNESS	= 486


;Arrays for pickung up common stuff (things that do not drop from enemies (i.e. rice wine etc.)) are not listed.
Global Const $EVENT_ID_ARRAY[29] =	[28,	$MODEL_ID_TOTS, $MODEL_ID_GOLDEN_EGGS, $MODEL_ID_BUNNIES, $MODEL_ID_GROG, $MODEL_ID_SHAMROCK_ALE, $MODEL_ID_CLOVER, $MODEL_ID_PIE, $MODEL_ID_CIDER, $MODEL_ID_POPPERS, $MODEL_ID_ROCKETS, $MODEL_ID_CUPCAKES,  _
											$MODEL_ID_SPARKLER, $MODEL_ID_HONEYCOMB, $MODEL_ID_VICTORY_TOKEN, $MODEL_ID_LUNAR_TOKEN, $MODEL_ID_HUNTERS_ALE, $MODEL_ID_PUMPKIN_COOKIE, $MODEL_ID_KRYTAN_BRANDY, $MODEL_ID_BLUE_DRINK, $MODEL_ID_FRUITCAKE, _
											$MODEL_ID_SPIKED_EGGNOGG, $MODEL_ID_EGGNOGG, $MODEL_ID_SNOWMAN_SUMMONER, $MODEL_ID_FROSTY_TONIC, $MODEL_ID_MISCHIEVOUS_TONIC, $MODEL_ID_DELICIOUS_CAKE, $MODEL_ID_ICED_TEA, $MODEL_ID_PARTY_BEACON]
Global Const $ALCOHOL_ID_ARRAY[9] = [8, $MODEL_ID_GROG, $MODEL_ID_SHAMROCK_ALE, $MODEL_ID_CIDER, $MODEL_ID_HUNTERS_ALE, $MODEL_ID_KRYTAN_BRANDY, $MODEL_ID_SPIKED_EGGNOGG, $MODEL_ID_EGGNOGG, $MODEL_ID_ICED_TEA]
Global Const $SWEETS_ID_ARAY[9] = [8, $MODEL_ID_GOLDEN_EGGS, $MODEL_ID_BUNNIES, $MODEL_ID_PIE, $MODEL_ID_HONEYCOMB, $MODEL_ID_PUMPKIN_COOKIE, $MODEL_ID_BLUE_DRINK, $MODEL_ID_FRUITCAKE, $MODEL_ID_DELICIOUS_CAKE]
Global Const $PARTY_ID_ARAY[8] = [7, $MODEL_ID_POPPERS, $MODEL_ID_ROCKETS, $MODEL_ID_SPARKLER, $MODEL_ID_SNOWMAN_SUMMONER, $MODEL_ID_FROSTY_TONIC, $MODEL_ID_MISCHIEVOUS_TONIC, $MODEL_ID_PARTY_BEACON]
Global Const $MATERIAL_ID_ARRAY[14] = [13, $MODEL_ID_BONES, $MODEL_ID_DUST, $MODEL_ID_IRON, $MODEL_ID_FEATHERS, $MODEL_ID_PLANT_FIBRES, $MODEL_ID_SCALES, $MODEL_ID_CHITIN, $MODEL_ID_GRANITE, $MODEL_ID_MONSTROUS_EYE, $MODEL_ID_MONSTROUS_FANG, $MODEL_ID_MONSTROUS_CLAW, $MODEL_ID_RUBY, $MODEL_ID_SAPPHIRE]
Global Const $TOME_ID_ARRAY[3] = [2, $MODEL_ID_TOME_E_SIN, $MODEL_ID_TOME_R_PARA]	;lowest ID and highest ID

;Hero IDs [ID, "short Name"]
Global Enum $HERO_ID_Norgu = 1, $HERO_ID_Goren, $HERO_ID_Tahlkora, $HERO_ID_Master, $HERO_ID_Jin, $HERO_ID_Koss, $HERO_ID_Dunkoro, $HERO_ID_Sousuke, $HERO_ID_Melonni, $HERO_ID_Zhed, $HERO_ID_Morgahn, $HERO_ID_Margrid, $HERO_ID_Zenmai, $HERO_ID_Olias, $HERO_ID_Razah, $HERO_ID_Mox, $HERO_ID_Keiran, $HERO_ID_Jora, $HERO_ID_Brandor, $HERO_ID_Anton, $HERO_ID_Livia, $HERO_ID_Hayda, $HERO_ID_Kahmu, $HERO_ID_Gwen, $HERO_ID_Xandra, $HERO_ID_Vekk, $HERO_ID_Ogden, $HERO_ID_MERCENARY_1, $HERO_ID_MERCENARY_2, $HERO_ID_MERCENARY_3, $HERO_ID_MERCENARY_4, $HERO_ID_MERCENARY_5, $HERO_ID_MERCENARY_6, $HERO_ID_MERCENARY_7, $HERO_ID_MERCENARY_8, $HERO_ID_Miku , $HERO_ID_Zei_Ri
Global Const $HERO_ID[38][2] = [ [37, 1], [1, "Norgu"], [2, "Goren"], [3, "Tahlkora"], [4, "Master"], [5, "Jin"], [6, "Koss"], [7, "Dunkoro"], [8, "Sousuke"], [9, "Melonni"], [10, "Zhed"], [11, "Morgahn"], [12, "Margrid"], [13, "Zenmai"], [14, "Olias"], [15, "Razah"], [16, "Mox"], [17, "Keiran"], [18, "Jora"], [19, "Brandor"], [20, "Anton"], [21, "Livia"], [22, "Hayda"], [23, "Kahmu"], [24, "Gwen"], [25, "Xandra"], [26, "Vekk"], [27, "Ogden"], [28, "Mercenary Hero 1"], [29, "Mercenary Hero 2"], [30, "Mercenary Hero 3"], [31, "Mercenary Hero 4"], [32, "Mercenary Hero 5"], [33, "Mercenary Hero 6"], [34, "Mercenary Hero 7"], [35, "Mercenary Hero 8"], [36, "Miku"], [37, "Zei Ri"] ]