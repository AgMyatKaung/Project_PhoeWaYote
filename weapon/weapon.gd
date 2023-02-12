extends Area2D

var direction = Vector2.ZERO
var speed = 400

func _process(delta):
	translate(direction.normalized() * speed * delta)



func _on_weapon_area_entered(area):
	queue_free()


func _on_weapon_body_entered(body):
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
