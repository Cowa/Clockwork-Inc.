extends Container

func _ready():
	set_process(true)
	pass

func _process(delta):
	get_node("Label").set_text("x" + str(state_player.current_coins))