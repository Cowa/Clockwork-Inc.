extends Button

export var max_clicked = 10
var clicked = 0

signal power_given
signal max_power_generated_reached

func _ready():
	connect("power_given", get_node("../battery/battery_gauge"), "_on_power_received")
	connect("max_power_generated_reached", get_node("connector"), "_on_max_power_generated_reached")
	set_process(true)

func _process(delta):

func _on_button_pressed():
	if clicked < max_clicked:
		var power_created = 2
		clicked += 1
		emit_signal("power_given", power_created)
	else:
		get_node("../sound_player").play("input_powered")
		emit_signal("max_power_generated_reached")
