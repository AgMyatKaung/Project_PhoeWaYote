extends CharacterBody2D
class_name portal


var movement_speed =100

var hp = 100
var maxhp = 100
var last_movement = Vector2.UP
var time = 0

var experience = 0
var experience_level = 1
var collected_experience = 0

@onready var sprite = $Sprite2D
@onready var animPlayer = $AnimationPlayer
@onready var walkTimer = $Timer


func _physics_process(_delta):
	movement()

func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov,y_mov)
	# for game end tempo btn 
	var gameEnd = Input.get_action_strength("End")
	if gameEnd:
		get_tree().change_scene_to_file("res://TitleScreen/menu.tscn")
		
	# make sure for within screen 
	var viewRect := get_viewport_rect()
	position.x = clamp(position.x,0,viewRect.size.x)
	position.y = clamp(position.y,0,viewRect.size.y)

# animate left and right
	if mov.x < 0:
		sprite.flip_h = true
	elif mov.x > 0:
		sprite.flip_h = false
	
	if mov.length() > 0:
		animPlayer.play("run")
	else:
		animPlayer.play("idle")
	
	velocity = mov.normalized() * movement_speed
	move_and_slide()
	
	
func _on_area_2d_area_entered(area):
	if area is portal:
		get_tree().change_scene_to_file("res://Levels/survival_mode.tscn")
