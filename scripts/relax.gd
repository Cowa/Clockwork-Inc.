extends Node

var in_use = false

var ball_colors = 4
var items_collect = 10

var price = 10

var blue_ball = load("res://assets/blue_ball.png")
var red_ball = load("res://assets/red_ball.png")
var green_ball = load("res://assets/green_ball.png")
var yellow_ball = load("res://assets/yellow_ball.png")

var point_init_pos = Vector2(417, 427)

var clicked_to_open = 5

var ball_pulled = {
	"nb_clicked": 0,
	"id_item": 1
}

func _ready():
	set_process_input(true)
	get_node("point/clickable").connect("input_event", self, "_on_ball_input_event")
	get_node("anim_ball_falling").connect("finished", self, "_on_falling_ball_ended")
	randomize()
	pass

func _on_ball_input_event(viewport, event, shape):
	if ball_pulled.nb_clicked >= clicked_to_open:
		return
	
	if event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.pressed:
		get_node("sounds").play("ball_clicked")
		ball_pulled.nb_clicked += 1
		get_node("point/clickable/ball").set_scale(get_node("point/clickable/ball").get_scale() + Vector2(0.01, 0.01))
		
		if ball_pulled.nb_clicked >= clicked_to_open:
			get_node("sounds").play("ball_opened")
			get_node("point").set_pos(point_init_pos)
			get_node("point/clickable/ball").set_scale(Vector2(1, 1))
			in_use = false
			ball_pulled.nb_clicked = 0

func _on_insert_coins_pressed():
	if in_use:
		return
	
	if state_player.current_coins < price:
		get_node("sounds").play("not_enough_coins")
	else:
		in_use = true
		var color = pick_color()
		get_node("point/clickable/ball").set_texture(color)
		#get_node("point").show()
		
		get_node("sounds").play("coins_inserted")
		
		#get_node("sounds").play("rolling_balls")
		state_player.current_coins -= price
		get_node("anim_ball_falling").play("falling_ball")
		

func pick_color():
	var n = randi()%ball_colors+1
	if n == 1:
		return blue_ball
	elif n == 2:
		return red_ball
	elif n == 3:
		return green_ball
	else:
		return yellow_ball
	
func _on_falling_ball_ended():
	get_node("sounds").play("ball_touched_ground")
	pass