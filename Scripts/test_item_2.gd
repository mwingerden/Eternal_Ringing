extends Node2D

var interact = false
var player = null

@export var item: InvItem

@warning_ignore("unused_parameter")
func _process(delta):
	if interact:
		if Input.is_action_just_pressed("interact"):
			player.collect(item)
			queue_free()

func _on_interact_body_entered(body):
	if body.has_method("collect"):
		interact = true
		player = body

@warning_ignore("unused_parameter")
func _on_interact_body_exited(body):
	interact = false
