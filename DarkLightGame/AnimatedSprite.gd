extends AnimatedSprite

var timer

#add a timer as a child
#wait_time can be changed to make animation look better
func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 0.05
	timer.connect("timeout", self, "animateMe")
	timer.start()

#manipulate the animation style
func _process(delta):
	
	if Input.is_key_pressed(KEY_LEFT):
		self.animation = "run"
		self.position.x -= 200 * delta
	elif Input.is_key_pressed(KEY_RIGHT):
		self.animation = "run"
		self.position.x += 200 * delta
	elif Input.is_key_pressed(KEY_UP):
		self.animation = "jumpup"
		self.position.y -= 200 * delta
	elif Input.is_key_pressed(KEY_DOWN):
		self.animation = "jumpdown"
		self.position.y += 200 * delta	
	else:
		self.animation = "idle"
		

#loop through the frames
func animateMe():
	var numberOfFrames = 9
	
	if self.animation == "jumpup" || self.animation == "jumpdown" :
		numberOfFrames = 4
	
	if self.frame < numberOfFrames :
		self.frame += 1
	elif self.frame == numberOfFrames:
		self.frame = 0

