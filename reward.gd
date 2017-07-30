extends Node

var locked_color = Color(0, 0, 0)

func _ready():
	state_player.items
	
	if !state_player.items[1]:
		get_node("cat").set_modulate(locked_color)
	if !state_player.items[2]:
		get_node("deer").set_modulate(locked_color)
	if !state_player.items[3]:
		get_node("dragonfly").set_modulate(locked_color)
	if !state_player.items[4]:
		get_node("fish").set_modulate(locked_color)
	if !state_player.items[5]:
		get_node("giraffe").set_modulate(locked_color)
	if !state_player.items[6]:
		get_node("koala").set_modulate(locked_color)
	if !state_player.items[7]:
		get_node("ladybug").set_modulate(locked_color)
	if !state_player.items[8]:
		get_node("sheep").set_modulate(locked_color)
	pass
