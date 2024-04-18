extends Node2D

var active_character
var is_action_playing: bool


func _ready():
	initialize()

func initialize():
	active_character = get_child(0)
	is_action_playing = false

func play_turn(arg):
	if is_action_playing:
		return
	is_action_playing = true
	print("start turn", arg)
	await active_character.play_turn()
	print("end turn")
	var next_index = (active_character.get_index() + 1) % get_child_count()
	active_character = get_child(next_index)
	is_action_playing = false


# Start Combat
# |
# |---> Initialize Battle
# |       |
# |       |---> Determine Turn Order
# |       |
# |       |---> Display Combat HUD (Health, Mana, Turn Order, etc.)
# |
# |---> Player's Turn
# |       |
# |       |---> Display Available Actions (Attack, Use Item, Cast Spell, etc.)
# |       |
# |       |---> Player Selects Action
# |       |
# |       |---> Execute Selected Action
# |               |
# |               |---> Calculate Damage or Effect
# |               |
# |               |---> Apply Damage or Effect to Target(s)
# |               |
# |               |---> Update HUD (Health, Mana, etc.)
# |
# |---> Enemy's Turn
# |       |
# |       |---> Enemy AI Decision Making
# |       |
# |       |---> Execute Enemy Action
# |               |
# |               |---> Calculate Damage or Effect
# |               |
# |               |---> Apply Damage or Effect to Player Character(s)
# |               |
# |               |---> Update HUD (Health, Mana, etc.)
# |
# |---> Check Battle Conditions
# |       |
# |       |---> If Player's Team or Enemy's Team Defeated
# |               |
# |               |---> End Combat
# |                       |
# |                       |---> Display Victory or Defeat Screen
# |
# |---> Next Turn
#         |
#         |---> Repeat Player's Turn or Enemy's Turn based on Turn Order


