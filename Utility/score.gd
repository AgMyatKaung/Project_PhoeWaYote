extends Node


var currentScore = 0

var hightScore = 0

func _ready():
	var save_file = FileAccess.open("user://save.data", FileAccess.READ)
	if save_file!=null:
		hightScore = save_file.get_32()
	else :
		hightScore = 0
		save_game()

func save_game():
	var save_file = FileAccess.open("user://save.data",FileAccess.WRITE)
	save_file.store_32(hightScore)
