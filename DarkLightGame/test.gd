extends Node2D

onready var coin = preload("res://coin.tscn")
var screensize
var score = 0

func _ready():
	randomize()
	screensize = get_viewport().get_size()
	set_process(true)
	spawnCoins(4)
	
func spawnCoins(number):
	for i in range(number):
		var c = coin.instance()
		add_child(c)
		c.connect("coin_grabbed", self, "_on_coin_grabbed")
		c.position = Vector2(rand_range(50, screensize.x - 50), rand_range(screensize.y - 200, screensize.y - 50))

func _on_coin_grabbed():
		score += 10
		print(score)
		#$lightMask.rotation_degrees -=10