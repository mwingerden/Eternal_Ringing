extends Node

enum SPAWN {CLASS_START, CLASS_DOOR, CLASS_HALLWAY}
var new_spawn = SPAWN.CLASS_START
var class_start_pos = Vector2(814, 1591)
var class_door_pos = Vector2(3389, 1619)
var class_hallway_pos = Vector2(1767, 1399)

func set_player_pos(): 
	if new_spawn == SPAWN.CLASS_START:
		return class_start_pos
	elif new_spawn == SPAWN.CLASS_DOOR:
		return class_door_pos
	elif new_spawn == SPAWN.CLASS_HALLWAY:
		return class_hallway_pos
