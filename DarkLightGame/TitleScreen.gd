extends Control

func _ready():
	var audioStream =  AudioStreamPlayer.new()
	self.add_child(audioStream)
	audioStream.stream = load("res://audio/3880-hitman-by-kevin-macleod.ogg")
	audioStream.play()


func _on_Start_Game_button_pressed():
	get_tree().change_scene("LevelOne.tscn")


func _on_Quit_Button_pressed():
	get_tree().quit()
