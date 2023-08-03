extends CanvasLayer



var is_paused = false : set = set_is_paused
func _ready():

	visible = false
 

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		is_paused = !is_paused   


func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused


func _on_resume_pressed():
	is_paused = false
	visible = false


func _on_menu_pressed():
	is_paused = false
	get_tree().change_scene_to_file("res://TitleScreen/menu.tscn")
