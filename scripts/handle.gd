extends Sprite

var dragging = false
var power = 0
export var max_power = 30
export var power_generated_by_step = 10

var previous_angle = -1
var previous_rotation = 0

signal send_power
signal max_power_generated_reached

func _ready():
	get_node("Area2D").connect("input_event", self, "_on_area_input_event")
	set_process_input(true)
	connect("send_power", get_node("../connector"), "_on_power_received")
	connect("max_power_generated_reached", get_node("../connector"), "_on_max_power_generated_reached")

func _on_area_input_event(viewport, event, shape):
	if event.type == InputEvent.MOUSE_BUTTON:
		dragging = event.pressed

func _input(event):
	if dragging:
		if event.type == InputEvent.MOUSE_MOTION:
			var motion = event.relative_pos
			var new_pos = get_global_mouse_pos()
			var prev_pos = new_pos - motion
			var center = get_global_pos()
			var angle = (prev_pos - center).angle_to(new_pos - center)
			
			if is_rotating_clockwise(previous_angle, angle):
				previous_angle = angle
				rotate(angle)
				
				if previous_rotation <= 0 and get_global_rotd() >= 0:
					if power >= max_power:
						get_node("../../sound_player").play("input_powered")
						emit_signal("max_power_generated_reached")
					else:
						emit_signal("send_power", power_generated_by_step)
						power += power_generated_by_step
				previous_rotation = get_global_rotd()
			
		elif event.type == InputEvent.MOUSE_BUTTON and event.pressed == false:
			# Stop dragging when the user releases the mouse button
			dragging = false

func is_rotating_clockwise(old, new):
	if old < 0 and new < 0:
		return true
	else:
		return false

func _on_power_loose(power_loose):
	power -= power_loose / 2
	power = max(0, power)
