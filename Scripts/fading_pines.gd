extends Node2D

signal world_changed(world_name)
var entered = false
var next_area = ""
@onready var player = $Alex

func _ready():
	SignalManager.class_start.connect(class_start)
	SignalManager.class_door.connect(class_door)
	SignalManager.class_hallway_door.connect(class_hallway)

func class_start():
	player.position = Utils.class_start_pos

func class_door():
	player.position = Utils.class_door_spawn

func class_hallway():
	print(Utils.class_hallway_spawn)
	player.position = Utils.class_hallway_spawn

@warning_ignore("unused_parameter")
func _process(delta):
	if entered:
		if Input.is_action_just_pressed("ui_accept"):
			SceneTransition.change_scene(next_area)

@warning_ignore("unused_parameter")
func _on_door_to_school_hallway_body_entered(body: PhysicsBody2D):
	entered = true
	next_area = "res://Scene/Areas/school_hallway.tscn"

@warning_ignore("unused_parameter")
func _on_door_to_class_body_entered(body: PhysicsBody2D):
	entered = true
	next_area = "res://Scene/Areas/detention_classroom.tscn"

@warning_ignore("unused_parameter")
func _on_door_to_school_hallway_body_exited(body):
	entered = false

@warning_ignore("unused_parameter")
func _on_door_to_class_body_exited(body):
	entered = false