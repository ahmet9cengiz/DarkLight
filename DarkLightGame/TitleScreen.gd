extends Control

func _ready():
	globalScript.score = 0
	globalScript.life = 1
	var audioStream =  AudioStreamPlayer.new()
	self.add_child(audioStream)
	audioStream.stream = load("res://audio/3868-hero-down-by-kevin-macleod.ogg")
	audioStream.play()


func _on_Start_Game_button_pressed():
	get_tree().change_scene("Introduction.tscn")


func _on_Quit_Button_pressed():
	get_tree().quit()
	


func _on_Credits_pressed():
	get_tree().change_scene("Credits.tscn")