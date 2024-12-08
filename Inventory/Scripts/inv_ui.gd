extends Control

@onready var inv: Inv = preload("res://Inventory/Scenes/playerinv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open = false
var can_open = true

func _ready():
	SignalManager.update.connect(update_slots)
	SignalManager.inv_can_open.connect(inventory_can_open)
	update_slots()
	close()

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])

@warning_ignore("unused_parameter")
func _process(delta):
	if can_open:
		if Input.is_action_just_pressed("i"):
			if is_open:
				close()
				SignalManager.player_can_move.emit()
			else:
				open()
				SignalManager.player_can_move.emit()

func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false
	
func inventory_can_open():
	can_open = !can_open
