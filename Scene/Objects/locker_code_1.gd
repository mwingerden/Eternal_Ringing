extends Node2D

@onready var numbers = [
	$Panel/HBoxContainer/Label1,
	$Panel/HBoxContainer/Label2,
	$Panel/HBoxContainer/Label3,
	$Panel/HBoxContainer/Label4
]

var correct_code = 1112
var current_num = 0
var red = Color(1.0, 0.0, 0.0, 1.0)
var white = Color(1.0, 1.0, 1.0, 1.0)

func _ready():
	highlight_current()

@warning_ignore("unused_parameter")
func _process(delta):
	if visible:
		if Input.is_action_just_pressed("ui_right"):
			navigate(1)
		elif Input.is_action_just_pressed("ui_left"):
			navigate(-1)

		if Input.is_action_just_pressed("ui_up"):
			adjust_number(1)
		elif Input.is_action_just_pressed("ui_down"):
			adjust_number(-1)

		if Input.is_action_just_pressed("enter_code"):
			check_code()

func navigate(direction):
	numbers[current_num].set("theme_override_colors/font_color", white)
	current_num = clamp(current_num + direction, 0, numbers.size() - 1)
	highlight_current()

func adjust_number(delta):
	var label = numbers[current_num]
	var text = clamp(int(label.text) + delta, 0, 9)
	label.text = str(text)

func highlight_current():
	numbers[current_num].set("theme_override_colors/font_color", red)

func check_code():
	var combined_text = ""
	#var sum = 0
	
	for num in numbers:
		combined_text += num.text
	
	#for num in combined_text:
		#sum += int(num)
	
	var result = int(combined_text)
	
	#if sum != 0:
	if result == correct_code:
		print("Correct code")
		SignalManager.code_correct.emit()
		reset()
	else:
		print("Incorrect code")
		SignalManager.code_incorrect.emit()
		reset()

func reset():
	current_num = 0
	for i in numbers.size():
		numbers[i].text = "0"
		numbers[i].set("theme_override_colors/font_color", white)
	highlight_current()
