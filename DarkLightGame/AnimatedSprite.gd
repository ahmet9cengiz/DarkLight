extends AnimatedSprite

var timer

#add a timer as a child
#wait_time can be changed to make animation look better
func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 0.11
	timer.start()

#manipulate the animation style
func _process(delta):
	if Input.is_key_pressed(KEY_LEFT):
		self.animation = "run"
		timer.connect("timeout", self, "animateMe")
		self.position.x -= 100 * delta
	elif Input.is_key_pressed(KEY_RIGHT):
		self.animation = "run"
		timer.connect("timeout", self, "animateMe")
		self.position.x += 100 * delta
	else:
		self.animation = "idle"

#loop through the frames
func animateMe():
	if self.frame < 9 :
		self.frame += 1
	elif self.frame == 9:
		self.frame = 0

