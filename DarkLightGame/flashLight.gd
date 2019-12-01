extends Area2D

func _process(delta):
	pass

func _on_flashLight_body_entered(body):
	if body.name == "Player":
		print("GAME OVER!")