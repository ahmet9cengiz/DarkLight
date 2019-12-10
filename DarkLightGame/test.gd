extends Node2D

onready var coin = preload("res://coin.tscn")

var screensize

func _ready():
	randomize()
	screensize = get_viewport().get_size()
	$"/root/globalScript".connect("game_over", self, "_on_game_over")
	set_process(true)

func _on_game_over():	
	$Player.die()
