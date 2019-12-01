extends Node2D

onready var flashLight = preload("res://flashLight.tscn")
onready var lightContainer = get_node("lightContainer")
var screensize

func _ready():
	randomize()
	screensize = get_viewport().get_size()
	set_process(true)
	spawnLights(4)
	
func spawnLights(number):
	for i in range(number):
		var l = flashLight.instance()
		lightContainer.add_child(l)
		l.position = Vector2(rand_range(50, screensize.x - 50), rand_range(50, screensize.y - 50))
