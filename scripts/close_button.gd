extends Button

func _ready():
	pass

func _on_close_button_pressed():
	get_tree().change_scene("res://menu.tscn")

func _on_close_button_pressed_ingame():
	get_tree().change_scene("res://level_selector.tscn")
