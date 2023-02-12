extends KinematicBody2D

var Weapon = preload("res://weapon/weapon.tscn")

const ACCELERATION = 500
const MAX_SPEED = 100
const FRICTION = 500

var velocity = Vector2.ZERO

func _physics_process(delta): # movenemt
	var input_vector = Vector2.ZERO
	input_vector.x= Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y= Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		
	else:
		velocity  = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		# player fire
#	if Input.is_action_just_pressed("fire"):
#		var weapon_direction = self.global_position.direction_to(get_global_mouse_position())
#		fire(weapon_direction)
		
		# player moving
	move_and_collide(velocity * delta)
	
	# firing system
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("fire"):
		fire()
	
func fire():
		var weapon = Weapon.instance()
		weapon.direction = $weapon2/Position2D.global_position - global_position
		weapon.global_position = $weapon2/Position2D.global_position
		get_tree().get_root().add_child(weapon)
	

	

	
	
