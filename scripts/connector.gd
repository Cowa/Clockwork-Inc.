extends Sprite

var powered = false

func _ready():
	set_process(true)

func _process(delta):
	update()

func _on_max_power_generated_reached():
	if !powered:
		set_texture(load("res://assets/connector_powered.png"))
		powered = true
