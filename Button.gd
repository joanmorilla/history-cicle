extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(self._button_pressed)
	pass # Replace with function body.

func _button_pressed():
	print(text)
	var children = get_children()
	for child in children:
		if child.has_method("print_message"):
			child.print_message()

