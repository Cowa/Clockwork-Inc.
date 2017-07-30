extends Button

export var max_clicked = 10
var clicked = 0
export var power_generated_by_step = 2

signal power_given
signal max_power_generated_reached

func _ready():
	connect("power_given", get_node("connector"), "_on_power_received")
	connect("max_power_generated_reached", get_node("connector"), "_on_max_power_generated_reached")
	set_process(true)

func _process(delta):
	pass

func _on_button_pressed():
	if clicked < max_clicked:
		clicked += 1
		emit_signal("power_given", power_generated_by_step)
	else:
		get_node("../sound_player").play("input_powered")
		emit_signal("max_power_generated_reached")

func _on_power_loose(power_loose):
	clicked -= power_loose / 2
	clicked = max(0, clicked)
