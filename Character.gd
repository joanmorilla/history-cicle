extends Node2D
class_name Character

@export var health_component: HealthComponent

func play_turn(action, target: Character):
	print("this is my turn ", name)
	print("I'll ", action, "!!!")
	if action == "Attack" && target && target.health_component:
		target.health_component.take_damage(5)
	await get_tree().create_timer(1).timeout
	print("my turn has come to an end")

func paint_blue():
	modulate = Color.BLUE

func paint_green():
	modulate = Color.GREEN

func paint_red():
	modulate = Color.RED

func paint_reset():
	modulate = Color.WHITE
