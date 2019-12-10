extends Node2D

func _ready():
	for c in get_children():
		c.connect("coin_grabbed", self, "_on_coin_grabbed")
		
func _on_coin_grabbed():
	$"/root/globalScript".score += 10