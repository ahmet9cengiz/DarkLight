extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var audioStream =  AudioStreamPlayer.new()
	self.add_child(audioStream)
	audioStream.stream = load("res://audio/4490-the-descent-by-kevin-macleod.ogg")
	audioStream.play()
	
	
func _process(delta):
  $HUD/Score.set_text("Pay Check: " + str(globalScript.score))
  pass
