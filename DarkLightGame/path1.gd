extends Path2D

func _ready():
	set_process(true)

func _process(delta):
	$follower.offset += 350 * delta