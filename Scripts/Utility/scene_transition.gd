extends CanvasLayer

@onready var anim = $AnimationPlayer

func change_scene(target):
	anim.play("dissolve")
	await anim.animation_finished
	get_tree().change_scene_to_file(target)
	anim.play_backwards("dissolve")
	match target:
		"res://Scene/Areas/school_hallway.tscn": 
			Utils.new_spawn = Utils.SPAWN.CLASS_HALLWAY
		"res://Scene/Areas/detention_classroom.tscn":
			Utils.new_spawn = Utils.SPAWN.CLASS_DOOR
	await anim.animation_finished
