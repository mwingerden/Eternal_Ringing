extends CanvasLayer

@onready var anim = $AnimationPlayer

func change_scene(target):
	anim.play("dissolve")
	await anim.animation_finished
	get_tree().change_scene_to_file(target)
	match target:
		"res://Scene/Areas/school_hallway.tscn": 
			SignalManager.class_hallway_door.emit()
		"res://Scene/Areas/detention_classroom.tscn":
			SignalManager.class_door.emit()
	anim.play_backwards("dissolve")
	await anim.animation_finished
