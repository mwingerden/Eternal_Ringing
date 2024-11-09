extends CharacterBody2D

@export var speed = 700
@export var inv: Inv

var can_move = true

func _ready():
	SignalManager.player_can_move.connect(inventory_open)

@warning_ignore("unused_parameter")
func _physics_process(delta):
	get_input()
	move_and_slide()

func get_input():
	if can_move:
		var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = input_dir * speed
	else:
		velocity = Vector2.ZERO

func collect(item):
	inv.insert(item)

func inventory_open():
	can_move = !can_move
