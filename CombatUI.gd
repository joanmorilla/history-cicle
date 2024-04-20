extends Control

@export var turn_queue: Node2D
@onready var first_button = $BottomPanel/GridContainer.get_child(0)

@onready var health_bar_container = $VBoxContainer
@onready var template_health_bar = $VBoxContainer/HFlowContainer

var target

signal action_pressed(arg) # send arguments via signal

func _ready():
	# Grab focus of the first button
	enable_controls()
	pass 

func build_health_bars(entities: Array[Node]):
	for entity in entities:
		var entity_health_bar = template_health_bar.duplicate()
		entity_health_bar.get_child(0).text = entity.name
		entity_health_bar.get_child(1).get_child(1).scale.x = 1
		health_bar_container.add_child(entity_health_bar)
	health_bar_container.remove_child(health_bar_container.get_child(0))

func enable_controls():
	first_button.grab_focus()

func disable_controls():
	for button in $BottomPanel/GridContainer.get_children():
		button.release_focus()

func _on_attack_pressed():
	print("Attack")
	turn_queue.select_action("Attack")
	pass # Replace with function body.

func _on_defend_pressed():
	print("Defend")
	turn_queue.select_action("Defend")
	pass # Replace with function body.

func _on_magic_pressed():
	print("Magic")
	turn_queue.select_action("Magic")
	pass # Replace with function body.
	
func _on_especial_pressed():
	print("Especial")
	turn_queue.select_action("Especial")
	pass # Replace with function body.

# Exported functions
func init_combat_ui():
	print("Combate preparado")
