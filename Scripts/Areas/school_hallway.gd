extends Node2D

signal world_changed(world_name)
var entered_class = false
var entered_locker = false
var next_area = ""

@onready var player = $Alex
@onready var class_hallway_spawn = $ClassHallwaySpawn
@onready var enter_class = $EnterClass
@onready var open_locker = $OpenLocker
@onready var locker_code_1 = $Locker_Code_1

func _ready():
	enter_class.visible = false
	open_locker.visible = false
	locker_code_1.visible = false
	if Utils.new_spawn == Utils.SPAWN.CLASS_HALLWAY:
		player.position = class_hallway_spawn.position
	
	SignalManager.code_correct.connect(entered_code_correct)
	SignalManager.code_incorrect.connect(entered_code_incorrect)

@warning_ignore("unused_parameter")
func _process(delta):
	if entered_class:
		if Input.is_action_just_pressed("ui_accept"):
			SceneTransition.change_scene(next_area)
	elif entered_locker:
		if Input.is_action_just_pressed("ui_accept"):
			locker_code_1.visible = true
			SignalManager.player_can_move.emit()
			SignalManager.inv_can_open.emit()
			entered_locker = false

func _on_door_to_class_body_entered(body):
	if body.has_method("collect"):
		entered_class = true
		next_area = "res://Scene/Areas/detention_classroom.tscn"
		enter_class.visible = true

func _on_door_to_class_body_exited(body):
	if body.has_method("collect"):
		entered_class = false
		enter_class.visible = false

func _on_alex_locker_body_entered(body):
	if body.has_method("collect"):
		entered_locker = true
		open_locker.visible = true

func _on_alex_locker_body_exited(body):
	if body.has_method("collect"):
		entered_locker = false
		open_locker.visible = false

func entered_code_correct():
	locker_code_1.visible = false
	SignalManager.player_can_move.emit()
	SignalManager.inv_can_open.emit()
	entered_locker = true

func entered_code_incorrect():
	locker_code_1.visible = false
	SignalManager.player_can_move.emit()
	SignalManager.inv_can_open.emit()
	entered_locker = true
