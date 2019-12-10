extends Node2D

onready var effect = $effect
onready var sprite = $AnimatedSprite

signal endLevel_grabbed 

func _ready():
	effect.interpolate_property(sprite, 'scale', sprite.scale, Vector2(1.0, 1.0), 1, Tween.TRANS_QUAD, Tween.EASE_OUT)
	effect.interpolate_property(sprite, 'modulate', Color(1,1,1,1), Color(1,1,1,0), 1, Tween.TRANS_QUAD, Tween.EASE_OUT)
	
	
func _on_EndLevelCoin_body_entered(body):
	if body.get_name() == "Player":
		emit_signal("endLevel_grabbed")
		$coinCollect.play()
		$CollisionShape2D.queue_free() #free the collision so that one coin can't be grabbed multiple times
		#get_tree().change_scene("LevelOneEnding.tscn")
		effect.start()
	
func _on_effect_tween_completed(object, key):
	queue_free() #free the coin entirely
	get_tree().change_scene("LevelOneEnding.tscn")

	
