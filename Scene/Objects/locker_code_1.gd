extends Node2D

@onready var num_1 = $Panel/HBoxContainer/Label1
@onready var num_2 = $Panel/HBoxContainer/Label2
@onready var num_3 = $Panel/HBoxContainer/Label3
@onready var num_4 = $Panel/HBoxContainer/Label4

var correct_code = 1112
var current_num = 1
var red = Color(1.0,0.0,0.0,1.0)
var white = Color(1.0,1.0,1.0,1.0)

func _ready():
	num_1.set("theme_override_colors/font_color",red)
	#num_1.add_color_override("font_color", Color("fcff00"))

@warning_ignore("unused_parameter")
func _process(delta):
	if current_num == 1:
		if Input.is_action_just_pressed("ui_right"):
			num_1.set("theme_override_colors/font_color",white)
			num_2.set("theme_override_colors/font_color",red)
			current_num = 2
			
		if Input.is_action_just_pressed("ui_up"):
			var text = int(num_1.text) + 1
			if text > 9:
				text = 9
			num_1.text = str(text)
		elif Input.is_action_just_pressed("ui_down"):
			var text = int(num_1.text) - 1
			if text < 0:
				text = 0
			num_1.text = str(text)
	elif current_num == 2:
		if Input.is_action_just_pressed("ui_right"):
			num_2.set("theme_override_colors/font_color",white)
			num_3.set("theme_override_colors/font_color",red)
			current_num = 3
		elif Input.is_action_just_pressed("ui_left"):
			num_2.set("theme_override_colors/font_color",white)
			num_1.set("theme_override_colors/font_color",red)
			current_num = 1
			
		if Input.is_action_just_pressed("ui_up"):
			var text = int(num_2.text) + 1
			if text > 9:
				text = 9
			num_2.text = str(text)
		elif Input.is_action_just_pressed("ui_down"):
			var text = int(num_2.text) - 1
			if text < 0:
				text = 0
			num_2.text = str(text)
	elif current_num == 3:
		if Input.is_action_just_pressed("ui_right"):
			num_3.set("theme_override_colors/font_color",white)
			num_4.set("theme_override_colors/font_color",red)
			current_num = 4
		elif Input.is_action_just_pressed("ui_left"):
			num_3.set("theme_override_colors/font_color",white)
			num_2.set("theme_override_colors/font_color",red)
			current_num = 2
			
		if Input.is_action_just_pressed("ui_up"):
			var text = int(num_3.text) + 1
			if text > 9:
				text = 9
			num_3.text = str(text)
		elif Input.is_action_just_pressed("ui_down"):
			var text = int(num_3.text) - 1
			if text < 0:
				text = 0
			num_3.text = str(text)
	elif current_num == 4:
		if Input.is_action_just_pressed("ui_left"):
			num_4.set("theme_override_colors/font_color",white)
			num_3.set("theme_override_colors/font_color",red)
			current_num = 3
			
		if Input.is_action_just_pressed("ui_up"):
			var text = int(num_4.text) + 1
			if text > 9:
				text = 9
			num_4.text = str(text)
		elif Input.is_action_just_pressed("ui_down"):
			var text = int(num_4.text) - 1
			if text < 0:
				text = 0
			num_4.text = str(text)
	
	if Input.is_action_just_pressed("ui_accept"):
		var combined_text = num_1.text + num_2.text + num_3.text + num_4.text
		var result = int(combined_text)
		if result == correct_code:
			print("correct code")
		else:
			print("Incorrect code")
		
