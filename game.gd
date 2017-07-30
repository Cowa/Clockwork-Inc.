extends Node2D

export var coins_to_earn = 1
export var level_id = 1

func _ready():
	pass

func _on_battery_charged():
	state_player.current_coins += coins_to_earn
	state_player.coins_earned += coins_to_earn
	state_player.levels_done[level_id] = true
	get_node("animation").play("popup_win")

func _on_timer_ended():
	get_node("animation").play("popup_lose")