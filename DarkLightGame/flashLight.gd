extends Area2D

func _on_flashLight_body_entered(body):
	if body.name == "Player":
		print("GAME OVER!")