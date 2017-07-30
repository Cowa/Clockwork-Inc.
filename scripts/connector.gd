extends Sprite

const NORMAL = 0
const POWERED = 1
const FORBIDDEN = 2

export var state = NORMAL

var powered = load("res://assets/connector_powered.png")
var normal = load("res://assets/connector_unpowered.png")
var forbidden = load("res://assets/connector_forbidden.png")

signal power_given
signal power_loose

func _ready():
	connect("power_given", get_node("../../battery/battery_gauge"), "_on_power_received")
	connect("power_loose", get_node("../../battery/battery_gauge"), "_on_power_loose")
	connect("power_loose", get_parent(), "_on_power_loose")
	set_process(true)

func _process(delta):
	if state == POWERED:
		set_texture(powered)
	elif state == FORBIDDEN:
		set_texture(forbidden)
	else:
		set_texture(normal)
	update()

func _on_max_power_generated_reached():
	if state != POWERED:
		state = POWERED

func _on_power_received(power_received):
	if state == NORMAL:
		emit_signal("power_given", power_received)
	elif state == FORBIDDEN:
		emit_signal("power_loose", power_received)
	else:
		pass