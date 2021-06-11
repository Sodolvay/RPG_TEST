extends KinematicBody2D

var velosity = Vector2()
const SPEED = 60
const GRAVITY = 10
const JUMP = 200
const FLOOR = Vector2(0, -1)

onready var _animated_sprite = $AnimatedSprite

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		_animated_sprite.play("run")
	elif Input.is_action_pressed("ui_right"):
		_animated_sprite.play("run")
	else:
		_animated_sprite.stop()


func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		velosity.x = -SPEED
	elif Input.is_action_pressed("ui_right"):
		velosity.x = SPEED
	else:
		velosity.x = 0
		
	if Input.is_action_pressed("ui_up"):
		velosity.y = -JUMP
	
	velosity.y += GRAVITY
		
	move_and_slide(velosity)
