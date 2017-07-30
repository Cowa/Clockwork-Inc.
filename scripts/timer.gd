extends ProgressBar

signal timer_ended

export var speed = 5

func _ready():
	set_process(true)
	connect("timer_ended", get_node("../../game"), "_on_timer_ended")
	pass

func _process(delta):
	if get_value() > 0:
		set_value(get_value() - speed * delta)
	else:
		set_process(false)
		emit_signal("timer_ended")

func _on_battery_charged():
	set_process(false)
