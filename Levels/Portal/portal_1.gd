extends Area2D

var change = "res://Levels/survival_mode.tscn"

func _on_body_entered(body):
	if body.is_in_group("player2"):
		change_scene()
	
func change_scene():
	var new_scene = change.instance()
	get_tree().get_root().add_child(new_scene)
	queue_free()
