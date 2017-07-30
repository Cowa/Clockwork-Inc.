extends Button

func _ready():
	pass

func _on_go_to_select_level_pressed():
	get_tree().change_scene("res://level_selector.tscn")
