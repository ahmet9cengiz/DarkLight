extends AnimatedSprite

var timer

func _ready():
	timer = Timer()
	
	pass
	
func _process(delta):
	if Input.is_key_pressed(KEY_LEFT):
		self.position.x -= 100 * delta
	elif Input.is_key_pressed(KEY_RIGHT):
		self.position.x += 100 * delta
	