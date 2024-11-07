extends CharacterBody2D

@export var speed = 700
@export var inv: Inv

func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed

@warning_ignore("unused_parameter")
func _physics_process(delta):
	get_input()
	move_and_slide()

func collect(item):
	inv.insert(item)
