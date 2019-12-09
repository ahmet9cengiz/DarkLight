extends Light2D

onready var effect = $lightMaskEffect

func _ready():
	effect.interpolate_property(self, 'rotation_degrees', self.rotation_degrees, -90, 20, Tween.TRANS_QUAD, Tween.EASE_IN)
	effect.start()

func _process(delta):
	pass

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		print("Out of the shade!")
