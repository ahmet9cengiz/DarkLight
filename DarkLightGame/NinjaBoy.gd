extends KinematicBody2D

const MAX_SPEED = 300
const GRAVITY = 20
const ACCELERATION = 30
const JUMP_HEIGHT = -500
const UP = Vector2(0,-1)
var motion = Vector2()
var canMove = true #don't allow to change direction mid-air

func _ready():
	pass
	$effect.interpolate_property(self, 'modulate', Color(1,1,1,1), Color(1,1,1,0), 2, Tween.TRANS_QUAD, Tween.EASE_OUT)

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	if position.y > 608:
		$"/root/globalScript".emit_signal("game_over")
	
	if Input.is_action_pressed("ui_right"):
		motion.x += ACCELERATION
		motion.x = min(motion.x, MAX_SPEED)
		$NinjaBoy.flip_h = false
		$NinjaBoy.play("run")
	elif Input.is_action_pressed("ui_left"):
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
			motion.x = lerp(motion.x, 0, 0.2) #tweak this to get slid
	else:
		canMove = false
		if motion.y < 0: #upto the falling point
			$NinjaBoy.play("jump")
		else:
			$NinjaBoy.play("fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.02)

	motion = move_and_slide(motion, UP)

func die():
	$effect.start()
	$NinjaBoy.play("die")
	set_physics_process(false) #stop moving

func _on_NinjaBoy_animation_finished():
	if $NinjaBoy.animation == "die":
		$NinjaBoy.playing = false
		$NinjaBoy.frame = 9
