extends Node
class_name HealthComponent

@onready var health_bar = $"../Control/HealthBar"
@export var max_health: float = 10

var health: float


func _ready():
	health = max_health
	health_bar.scale.x = 1

func take_damage(damage): 
	health = health - damage
	health_bar.scale.x = health/max_health
	if health <= 0:
		print("Oh no I died")
		get_parent().queue_free()
	else:
		print("Ouch! my current health is: ", health)
