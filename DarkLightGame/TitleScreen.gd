extends Control

func _ready():
	var audioStream =  AudioStreamPlayer.new()
	self.add_child(audioStream)
	audioStream.stream = load("res://audio/3880-hitman-by-kevin-macleod.ogg")
	audioStream.play()
