extends Node2D

func _ready():
	var audioStream =  AudioStreamPlayer.new()
	self.add_child(audioStream)
	audioStream.stream = load("res://audio/3880-hitman-by-kevin-macleod.ogg")
	audioStream.play()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene("LevelOne.tscn")