extends Node2D

func _ready():
	var audioStream =  AudioStreamPlayer.new()
	self.add_child(audioStream)
	audioStream.stream = load("res://audio/3880-hitman-by-kevin-macleod.ogg")
	audioStream.play()
	$TextEdit2.set_line_as_hidden(0, true)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		$TextEdit2.set_line_as_hidden(1,false)
		