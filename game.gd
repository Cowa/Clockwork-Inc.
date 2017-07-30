extends Node2D

export var coins_to_earn = 1

func _ready():
	pass

func _on_battery_charged():
	print("here")
	get_node("animation").play("popup_win")
