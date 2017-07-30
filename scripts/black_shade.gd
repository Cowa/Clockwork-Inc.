extends Node2D

func _ready():
	set_process(true)
	pass

func _process(delta):
	update()
	
func _draw():
	draw_rect(get_viewport_rect(), Color(0, 0, 0))
	