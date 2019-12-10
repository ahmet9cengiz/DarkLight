extends Node2D

func _ready():
	set_process(true)

func _process(delta):
	$path1/follower.offset += 150 * delta
	$path1/follower2.offset += 150 * delta
	$path2/follower.offset += 150 * delta
	$path3/follower.offset += 250 * delta
	$path4/follower.offset += 250 * delta
	$path5/follower.offset += 250 * delta
	$path6/follower.offset += 250 * delta
	$path7/follower.offset += 250 * delta
	$path8/follower.offset += 250 * delta
	$path9/follower.offset += 150 * delta
	$path9/follower2.offset += 150 * delta
	$path10/follower.offset += 150 * delta
	$path10/follower2.offset += 150 * delta