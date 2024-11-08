extends Node2D

signal world_changed(world_name)
var entered = false
var next_area = ""

@onready var player = $Alex
@onready var class_hallway_spawn = $ClassHallwaySpawn
@onready var enter_class = $EnterClass

func _ready():
	enter_class.visible = false
	if Utils.new_spawn == Utils.SPAWN.CLASS_HALLWAY:
		player.position = class_hallway_spawn.position

@warning_ignore("unused_parameter")
func _process(delta):
	if entered:
		if Input.is_action_just_pressed("ui_accept"):
			SceneTransition.change_scene(next_area)

func _on_door_to_class_body_entered(body):
	if body.has_method("collect"):
		entered = true
		next_area = "res://Scene/Areas/detention_classroom.tscn"
		enter_class.visible = true

func _on_door_to_class_body_exited(body):
	if body.has_method("collect"):
		entered = false
		enter_class.visible = false
