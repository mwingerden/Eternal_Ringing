extends Node2D

signal world_changed(world_name)
var entered = false
var next_area = ""

@onready var player = $Alex
@onready var enter_hallway = $EnterHallway
@onready var class_door_spawn = $ClassDoorSpawn
@onready var class_start = $ClassStart
@onready var test_item_1 = $TestItem
@onready var test_item_2 = $TestItem2

func _ready():
	#SignalManager.class_start.connect(class_start)
	#player.position = Utils.set_player_pos()
	#entered = false
	enter_hallway.visible = false
	
	if Utils.new_spawn == Utils.SPAWN.CLASS_START:
		player.position = class_start.position
	elif Utils.new_spawn == Utils.SPAWN.CLASS_DOOR:
		player.position = class_door_spawn.position
	
	if ItemManagement.test_item_1_picked_up:
		test_item_1.queue_free()

@warning_ignore("unused_parameter")
func _process(delta):
	if entered:
		if Input.is_action_just_pressed("ui_accept"):
			SceneTransition.change_scene(next_area)

func _on_door_to_school_hallway_body_entered(body: PhysicsBody2D):
	if body.has_method("collect"):
		entered = true
		next_area = "res://Scene/Areas/school_hallway.tscn"
		enter_hallway.visible = true

func _on_door_to_school_hallway_body_exited(body):
	if body.has_method("collect"):
		entered = false
		enter_hallway.visible = false
