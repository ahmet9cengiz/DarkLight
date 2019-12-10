extends Node2D

func _ready():
	var audioStream =  AudioStreamPlayer.new()
	self.add_child(audioStream)
	audioStream.stream = load("res://audio/yodaLaugh.ogg")
	audioStream.play()
	

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().quit()