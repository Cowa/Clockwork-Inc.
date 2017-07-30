extends Position2D

var energy = 0
var max_energy = 112

signal battery_charged

func _ready():
	connect("battery_charged", get_node("../../../game"), "_on_battery_charged")
	connect("battery_charged", get_node("../../timer"), "_on_battery_charged")
	set_process(true)

func _process(delta):
	if energy >= max_energy:
		get_node("../../sound_player").play("battery_charged")
		emit_signal("battery_charged")
		set_process(false)
	update()

func _draw():
	var height = min(max_energy, energy)
	draw_rect(Rect2(get_pos(), Vector2(80, -height)), Color("fffb85"))

func _on_power_received(power_received):
	get_node("../../sound_player").play("power_up")
	energy += power_received

func _on_power_loose(power_loose):
	get_node("../../sound_player").play("power_down")
	energy -= power_loose / 2
	energy = max(0, energy)