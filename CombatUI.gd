extends Control

@export var turn_queue: Node2D
@onready var first_button = $BottomPanel/GridContainer.get_child(0)

signal action_pressed(arg) # send arguments via signal

func _ready():
	# Grab focus of the first button
	first_button.grab_focus()
	pass 

func _on_attack_pressed():
	print("Attack")
	turn_queue.play_turn("Attack")
	pass # Replace with function body.

func _on_defend_pressed():
	print("Defend")
	turn_queue.play_turn("Defend")
	pass # Replace with function body.

func _on_magic_pressed():
	print("Magic")
	turn_queue.play_turn("Magic")
	pass # Replace with function body.
	
func _on_especial_pressed():
	print("Especial")
	turn_queue.play_turn("Especial")
	pass # Replace with function body.

# Exported functions
func init_combat_ui():
	print("Combate preparado")
