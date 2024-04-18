extends Sprite2D


func play_turn():
	print("this is my turn ", name)
	await get_tree().create_timer(3).timeout
	print("my turn has come to an end")
