extends Button

onready var label = get_node("label")

func move_label_on_pressed(pressed):
	var y_pos = 0
	if pressed:
		y_pos = label.get_pos().y + 10
	else:
		y_pos = label.get_pos().y - 10
	label.set_pos(Vector2(label.get_pos().x, y_pos))

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

func _on_button_day1_pressed():
	get_tree().change_scene("res://levels/level_1.tscn")


func _on_button_day2_pressed():
	get_tree().change_scene("res://levels/level_2.tscn")
