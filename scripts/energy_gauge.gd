extends Position2D

var energy = 0

func _ready():
	set_process(true)

func _process(delta):
	update()

func _draw():
	var height = min(112, energy)
	draw_rect(Rect2(get_pos(), Vector2(80, -height)), Color("fffb85"))

func _on_power_received(power_received):
	get_node("../../sound_player").play("power_up")
	energy += power_received
