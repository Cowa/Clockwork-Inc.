extends ProgressBar

func _ready():
	set_process(true)
	pass

func _process(delta):
	if get_value() > 0:
		set_value(get_value() - 0.05)
	else:
		set_process(false)
		print("timer end")

func _on_battery_charged():
	set_process(false)
