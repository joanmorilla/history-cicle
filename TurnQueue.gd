extends Node2D

@export var comabat_ui: Control

var active_character
var selected_action
var selected_target
var is_action_selected: bool = false
var is_action_playing: bool = false
var is_target_selected: bool = false

func _ready():
	initialize()

func initialize():
	active_character = get_child(0)
	selected_target = get_child(0)
	active_character.paint_green()
	comabat_ui.build_health_bars(get_children())

func _process(_delta):
	if !is_action_selected:
		return

	comabat_ui.disable_controls()
	
	var index_offset = 0
	if Input.is_action_just_pressed("ui_down"):
		index_offset = 1
	if Input.is_action_just_pressed("ui_up"):
		index_offset = -1
	
	var next_index = 0
	if selected_target != null:
		selected_target.paint_reset()
		next_index = (selected_target.get_index() + index_offset) % get_child_count()
	selected_target = get_child(next_index)
	selected_target.paint_blue()

	if Input.is_action_just_pressed("ui_accept"):
		select_target()
	
	if !is_target_selected:
		return

	if !is_action_playing:
		play_turn(selected_action, selected_target)
		return

	pass

func select_action(action):
	selected_action = action
	is_action_selected = true

func select_target():
	is_target_selected = true

func play_turn(arg, target):
	if is_action_playing:
		return
	is_action_playing = true

	is_action_selected = false
	is_target_selected = false
	target.paint_reset()

	print("start turn", arg)
	active_character.paint_red()
	await active_character.play_turn(arg, target)
	print("end turn")
	end_turn()

func end_turn():
	var next_index = (active_character.get_index() + 1) % get_child_count()
	active_character.paint_reset()
	active_character = get_child(next_index)
	active_character.paint_green()
	is_action_playing = false
	comabat_ui.enable_controls()

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
