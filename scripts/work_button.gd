extends Button

onready var label = get_node("label")

func _ready():
	print(label)
	set_process(true)

func _process(delta):
	update()

func move_label_on_pressed(pressed):
	var y_pos = 0
	if pressed:
		y_pos = label.get_pos().y + 10
	else:
		y_pos = label.get_pos().y - 10
	label.set_pos(Vector2(label.get_pos().x, y_pos))

### Work button
func _on_button_work_pressed():
	get_tree().change_scene("res://level_selector.tscn")

func _on_button_work_button_down():
	move_label_on_pressed(true)

func _on_button_work_button_up():
	move_label_on_pressed(false)

### Relax button
func _on_button_relax_button_down():
	move_label_on_pressed_level(true)

func _on_button_relax_button_up():
	move_label_on_pressed_level(false)

### Level day button
func move_label_on_pressed_level(pressed):
	var y_pos = 0
	if pressed:
		y_pos = label.get_pos().y + 10
	else:
		y_pos = label.get_pos().y - 10
	label.set_pos(Vector2(label.get_pos().x, y_pos))

func _on_button_day_button_down():
	move_label_on_pressed(true)

func _on_button_day_button_up():
	move_label_on_pressed(false)

func _on_button_relax_pressed():
	get_tree().change_scene("res://relax.tscn")
