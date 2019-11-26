extends KinematicBody2D

const MAX_SPEED = 400
const GRAVITY = 20
const ACCELERATION = 50
const JUMP_HEIGHT = -550
const UP = Vector2(0,-1)
var motion = Vector2()
var canMove = true

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	
	if Input.is_action_pressed("ui_right") and canMove:
		motion.x += ACCELERATION
		motion.x = min(motion.x, MAX_SPEED)
		$NinjaBoy.flip_h = false
		$NinjaBoy.play("run")
	elif Input.is_action_pressed("ui_left") and canMove:
		motion.x -= ACCELERATION
		motion.x = max(motion.x, -MAX_SPEED)
		$NinjaBoy.flip_h = true
		$NinjaBoy.play("run")
	else:
		$NinjaBoy.play("idle")
		friction = true
	
	if is_on_floor():
		canMove = true
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		canMove = false
		$NinjaBoy.play("jump")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.03)

	motion = move_and_slide(motion, UP)