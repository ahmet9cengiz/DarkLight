extends KinematicBody2D

var timer
const ACCELARATION = 50
const MAX_SPEED = 200
const GRAVITY = 20
var motion = Vector2()

#add a timer as a child
#wait_time can be changed to make animation look better
func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 0.05
	timer.connect("timeout", self, "animateMe")
	timer.start()
	
func _physics_process(delta):
	motion.y += GRAVITY
	get_node("NinjaBoy").animation = "idle"
	
	if Input.is_action_pressed("ui_right"):
		get_node("NinjaBoy").animation = "runRight"
		motion.x += ACCELARATION
		motion.x = min(motion.x, MAX_SPEED)
	if Input.is_action_pressed("ui_left"):
		get_node("NinjaBoy").animation = "runRight"
		motion.x -= ACCELARATION
		motion.x = max(motion.x, -MAX_SPEED)
		

#loop through the frames
func animateMe():
	var numberOfFrames = 9

	if get_node("NinjaBoy").frame < numberOfFrames :
		get_node("NinjaBoy").frame += 1
	elif get_node("NinjaBoy").frame == numberOfFrames:
		get_node("NinjaBoy").frame = 0