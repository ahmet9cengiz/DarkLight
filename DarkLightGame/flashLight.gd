extends Area2D


func _on_flashLight_body_entered(body):
	if body.name == "Player":
		$"/root/globalScript".emit_signal("game_over")
