extends Node2D

func _ready():
	set_process(true)
	
	if !state_player.levels_done[1]:
		get_node("2").set_disabled(true)
		get_node("2").set_opacity(0.3)
		
	if !state_player.levels_done[2]:
		get_node("3").set_disabled(true)
		get_node("3").set_opacity(0.3)
		
	if !state_player.levels_done[3]:
		get_node("4").set_disabled(true)
		get_node("4").set_opacity(0.3)
	
	if !state_player.levels_done[4]:
		get_node("5").set_disabled(true)
		get_node("5").set_opacity(0.3)
		
	if !state_player.levels_done[5]:
		get_node("6").set_disabled(true)
		get_node("6").set_opacity(0.3)
	
	if !state_player.levels_done[6]:
		get_node("7").set_disabled(true)
		get_node("7").set_opacity(0.3)
		
	if !state_player.levels_done[7]:
		get_node("8").set_disabled(true)
		get_node("8").set_opacity(0.3)
		
	if !state_player.levels_done[8]:
		get_node("9").set_disabled(true)
		get_node("9").set_opacity(0.3)
	pass

func _process(delta):
	pass

