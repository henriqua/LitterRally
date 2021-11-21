extends KinematicBody2D


const GRAVITY = 700
const ACCELERATION = 500
const MAX_SPEED = 80
const FRICTION = 500
const UP = Vector2(0, -1) 

var velocity = Vector2.ZERO


func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	velocity.y += GRAVITY * delta	
	
	#if Input.is_action_pressed("ui_right"):
		
	
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	
func _process(delta):
	velocity = move_and_slide_with_snap(velocity, UP)
	
