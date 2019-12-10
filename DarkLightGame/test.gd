extends Node2D

onready var coin = preload("res://coin.tscn")

var screensize

func _ready():
	randomize()
	screensize = get_viewport().get_size()
	$"/root/globalScript".connect("game_over", self, "_on_game_over")
	set_process(true)
	spawnCoins(10)
	
func spawnCoins(number):
	for i in range(number):
		var c = coin.instance()
		$coinContainer.add_child(c)
		c.connect("coin_grabbed", self, "_on_coin_grabbed")
		c.position = Vector2(rand_range(100,  2000), rand_range(screensize.y - 300, screensize.y - 100))

func _on_coin_grabbed():
	$"/root/globalScript".score += 10

func _on_game_over():	
	$Player.die()
