extends Sprite

onready var coins_to_earn = get_tree().get_root().get_node("game").get("coins_to_earn")
onready var pay = get_node("text/pay")
onready var coin = get_node("text/pay/coin")

func _ready():
	pay.set("text", "x" + str(coins_to_earn))

func _draw():
	for i in range(min(5, coins_to_earn)):
		var new_coin = coin.duplicate()
		new_coin.set_pos(Vector2(coin.get_pos().x - 25 * i, coin.get_pos().y))
		pay.add_child(new_coin)