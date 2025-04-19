;#####################################################
;# Headers Updated by Glob Of Armbraces and MrJambix #
;# Shout out to Greg76 for providing GWToolBox Plugin#
;# Update Checked 25.12.24                           #
;#####################################################

; Trading operations
Global Const $HEADER_TRADE_CANCEL = 0x0001          ; Cancel the current trade.
Global Const $HEADER_TRADE_ADD_ITEM = 0x0002        ; Add an item to the trade offer.
Global Const $HEADER_TRADE_SUBMIT_OFFER = 0x0003    ; Submit the current trade offer.
;~ Global Const $HEADER_MAX_ATTRIBUTES_CONST = 0x0004  ; Maximum attributes constant (not in use).
;~ Global Const $HEADER_TRADE_REMOVE_ITEM = 0x0005     ; Remove an item from the trade offer.
Global Const $HEADER_TRADE_CANCEL_OFFER = 0x0006    ; Cancel the trade offer made.
Global Const $HEADER_TRADE_ACCEPT = 0x0007          ; Accept the trade offer.
;~ Global Const $HEADER_DISCONNECT = 0x0008            ; Handle a disconnect event.
;~ Global Const $HEADER_PING_REPLY = 0x0009            ; Respond to a ping request.
;~ Global Const $HEADER_HEARTBEAT = 0x000A             ; Send a heartbeat signal to maintain connection.
;~ Global Const $HEADER_PING_REQUEST = 0x000B          ; Send a ping request to another entity.
;~ Global Const $HEADER_ATTRIBUTE_DECREASE = 0x000C    ; Decrease an attribute value.
;~ Global Const $HEADER_ATTRIBUTE_INCREASE = 0x000D    ; Increase an attribute value.
;~ Global Const $HEADER_ATTRIBUTE_LOAD = 0x000E        ; Load attribute data.

; Quest and Hero operations
Global Const $HEADER_QUEST_ABANDON = 0x0010         ; Abandon the selected quest.
Global Const $HEADER_QUEST_REQUEST_INFOS = 0x0011   ; Request information for a quest.
Global Const $HEADER_QUEST_SET_ACTIVE = 0x0013      ; Set a quest as active.
Global Const $HEADER_HERO_BEHAVIOR = 0x0014         ; Define hero behavior settings.
Global Const $HEADER_HERO_LOCK_TARGET = 0x0015      ; Lock onto a specific target.
Global Const $HEADER_HERO_SKILL_TOGGLE = 0x0018     ; Toggle a hero's skill on/off.
Global Const $HEADER_HERO_FLAG_SINGLE = 0x0019      ; Flag hero for single-target actions.
Global Const $HEADER_HERO_FLAG_ALL = 0x001A         ; Flag hero for multi-target actions.
Global Const $HEADER_HERO_USE_SKILL = 0x001B        ; Hero uses a specified skill.
Global Const $HEADER_HERO_ADD = 0x001D              ; Add a hero to the party or team.
Global Const $HEADER_HERO_KICK = 0x001E             ; Remove a hero from the party or team.
;~ Global Const $HEADER_MOVEMENT_TICK = 0x001E         ; Manage movement ticks (not in use).

; Action operations
Global Const $HEADER_ACTION_ATTACK = 0x0025         ; Initiate an attack.
;Global Const $HEADER_ATTACK_AGENT = 0x0024 ; Initiates an attack on a selected agent
Global Const $HEADER_ACTION_CANCEL = 0x0027         ; Cancel the current action.
Global Const $HEADER_BUFF_DROP = 0x0028             ; Drop or remove a buff.
Global Const $HEADER_CALL_TARGET = 0x22 ;Calls the target without attacking (Ctrl+Shift+Space)
;~ Global Const $HEADER_MAP_DRAW = 0x0029              ; Draw or update the map (not in use).
Global Const $HEADER_DROP_ITEM = 0x002B             ; Drop an item from the inventory.
Global Const $HEADER_DROP_GOLD = 0x002E             ; Drop gold or currency.
Global Const $HEADER_ITEM_EQUIP = 0x002F            ; Equip an item.
Global Const $HEADER_INTERACT_PLAYER = 0x0032       ; Interact with another player.
Global Const $HEADER_FACTION_DEPOSIT = 0x0034       ; Deposit resources into a faction bank.
Global Const $HEADER_INTERACT_LIVING = 0x0038       ; Interact with a living entity.
Global Const $HEADER_DIALOG_SEND = 0x003A           ; Send dialog choices.
;~ Global Const $HEADER_PLAYER_MOVE_COORD = 0x003C     ; Move player to specific coordinates (not in use).
Global Const $HEADER_ITEM_INTERACT = 0x003E         ; Interact with an item.
;~ Global Const $HEADER_PLAYER_ROTATE = 0x003E         ; Rotate the player (not in use).
Global Const $HEADER_PROFESSION_CHANGE = 0x0040     ; Change player's profession.
;~ Global Const $HEADER_SKILLS_OPEN = 0x0040           ; Open the skills interface (not in use).
;~ Global Const $HEADER_PROFESSION_ULOCK = 0x0040      ; Unlock a profession (not in use).
Global Const $HEADER_SKILL_USE = 0x0045             ; Use a specific skill (not in use).
Global Const $HEADER_TRADE_INITIATE = 0x0048        ; Initiate a trade with another player.
;~ Global Const $HEADER_BUY_MATERIALS = 0x0048         ; Buy materials (not in use).
;~ Global Const $HEADER_REQUEST_QUOTE = 0x004A         ; Request a quote for services or goods (not in use).
;~ Global Const $HEADER_TRANSACT_ITEMS = 0x004B        ; Transaction of items (not in use).
Global Const $HEADER_ITEM_UNEQUIP = 0x004E          ; Unequip an item.
Global Const $HEADER_GADGET_INTERACT = 0x0050       ; Interact with a gadget.
Global Const $HEADER_CHEST_OPEN = 0x0052            ; Open a treasure chest.
Global Const $HEADER_TITLE_DISPLAY = 0x0057         ; Display a title above the character.
Global Const $HEADER_TITLE_HIDE = 0x0058            ; Hide the displayed title.
Global Const $HEADER_SKILLBAR_SKILL_SET = 0x005B    ; Set a skill on the skillbar.
Global Const $HEADER_SKILLBAR_LOAD = 0x005C         ; Load the skillbar settings.
;~ Global Const $HEADER_SKILLBAR_SKILL_REPLACE = 0x005C; Replace a skill on the skillbar (not in use).
Global Const $HEADER_CINEMATIC_SKIP = 0x0062        ; Skip a cinematic scene.
Global Const $HEADER_SEND_CHAT_MESSAGE = 0x0063     ; Send a message in the chat.
Global Const $HEADER_ITEM_DESTROY = 0x0068          ; Destroy an item.
Global Const $HEADER_ITEM_IDENTIFY = 0x006B         ; Identify the properties of an item.
Global Const $HEADER_TOME_UNLOCK_SKILL = 0x006C     ; Unlock a skill using a tome.
Global Const $HEADER_ITEM_MOVE = 0x0071             ; Move an item within the inventory.
Global Const $HEADER_ITEMS_ACCEPT_UNCLAIMED = 0x0072; Accept unclaimed items.
Global Const $HEADER_ITEM_SPLIT_STACK = 0x0074      ; Split an item stack.
Global Const $HEADER_ITEM_SALVAGE_SESSION_OPEN = 0x0076   ; Open a salvage session.
Global Const $HEADER_ITEM_SALVAGE_SESSION_CANCEL = 0x0077 ; Cancel the salvage session.
Global Const $HEADER_ITEM_SALVAGE_SESSION_DONE = 0x0078   ; Complete the salvage session.
Global Const $HEADER_ITEM_SALVAGE_MATERIALS = 0x0079      ; Salvage materials from an item.
Global Const $HEADER_ITEM_SALVAGE_UPGRADE = 0x007A        ; Upgrade an item through salvage.
Global Const $HEADER_ITEM_CHANGE_GOLD = 0x007B            ; Change the gold amount for an item.
Global Const $HEADER_ITEM_USE = 0x007D                    ; Use an item.
;~ Global Const $HEADER_UPGRADE_ARMOR = 0x0083               ; Upgrade armor (not in use).
;~ Global Const $HEADER_UPGRADE = 0x0086                     ; General upgrade command (not in use).
;~ Global Const $HEADER_INSTANCE_LOAD_REQUEST_SPAWN = 0x0086 ; Request spawn in an instance (not in use).
;~ Global Const $HEADER_INSTANCE_LOAD_REQUEST_PLAYERS = 0x008E; Request player data in an instance (not in use).
;~ Global Const $HEADER_INSTANCE_LOAD_REQUEST_ITEMS = 0x008F ; Request item data in an instance (not in use).
Global Const $HEADER_PARTY_SET_DIFFICULTY = 0x009A        ; Set the difficulty for a party quest or dungeon.
Global Const $HEADER_PARTY_ACCEPT_INVITE = 0x009B         ; Accept an invitation to join a party.
;~ Global Const $HEADER_PARTY_ACCEPT_CANCEL = 0x009B         ; Cancel party invitation acceptance (not in use).
;~ Global Const $HEADER_PARTY_ACCEPT_REFUSE = 0x009C         ; Refuse an invitation to join a party.
Global Const $HEADER_PARTY_INVITE_NPC = 0x009E            ; Invite an NPC to the party.
Global Const $HEADER_PARTY_INVITE_PLAYER = 0x009F         ; Invite a player to the party.
Global Const $HEADER_PARTY_LEAVE_GROUP = 0x00A1           ; Leave the current party or group.
Global Const $HEADER_PARTY_CANCEL_ENTER_CHALLENGE = 0x00A2; Cancel entering a challenge.
Global Const $HEADER_PARTY_ENTER_CHALLENGE = 0x00A4       ; Enter a challenge or dungeon.
Global Const $HEADER_PARTY_RETURN_TO_OUTPOST = 0x00A6     ; Return the party to the outpost.
Global Const $HEADER_PARTY_KICK_NPC = 0x00A7              ; Kick an NPC from the party.
Global Const $HEADER_PARTY_KICK_PLAYER = 0x00A8           ; Kick a player from the party.
;~ Global Const $HEADER_PARTY_SEARCH_SEEK = 0x00A8           ; Search for a party (not in use).
;~ Global Const $HEADER_PARTY_SEARCH_CANCEL = 0x00A9         ; Cancel party search (not in use).
;~ Global Const $HEADER_PARTY_SEARCH_REQUEST_JOIN = 0x00AA   ; Request to join a party search (not in use).
;~ Global Const $HEADER_PARTY_ENTER_FOREIGN_CHALLENGE = 0x00AD; Enter a foreign challenge (not in use).
;~ Global Const $HEADER_PARTY_SEARCH_REQUEST_REPLY = 0x00AB  ; Reply to a party search request (not in use).
;~ Global Const $HEADER_PARTY_SEARCH_TYPE = 0x00AC           ; Set the search type for party search (not in use).
;~ Global Const $HEADER_PARTY_READY_STATUS = 0x00AD          ; Indicate ready status in party (not in use).
Global Const $HEADER_PARTY_ENTER_GUILD_HALL = 0x00AF      ; Enter a guild hall.
Global Const $HEADER_PARTY_TRAVEL = 0x00B0                ; Travel to a new location with the party.
Global Const $HEADER_PARTY_LEAVE_GUILD_HALL = 0x00B1      ; Leave the guild hall.

;=ITEMS=
Global Const $HEADER_ITEM_PICKUP = 0x3E ;Picks up an item from ground
Global Const $HEADER_ITEM_MOVE_EX = 0x73 ;Moves an item, with amount to be moved.
Global Const $HEADER_UPGRADE = 0x86 ;used by gwapi. is it even useful? NOT TESTED
Global Const $HEADER_UPGRADE_ARMOR_1 = 0x83 ;used by gwapi. is it even useful? NOT TESTED
Global Const $HEADER_UPGRADE_ARMOR_2 = 0x86 ;used by gwapi. is it even useful? NOT TESTED
Global Const $HEADER_EQUIP_BAG = 0x70
