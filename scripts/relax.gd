extends Node

var in_use = false

var ball_colors = 4
var items_collect = 8

var price = 10

var blue_ball = load("res://assets/blue_ball.png")
var red_ball = load("res://assets/red_ball.png")
var green_ball = load("res://assets/green_ball.png")
var yellow_ball = load("res://assets/yellow_ball.png")

var cat_badge = load("res://assets/badges/cat.png")
var deer_badge = load("res://assets/badges/deer.png")
var dragonfly_badge = load("res://assets/badges/dragonfly.png")
var fish_badge = load("res://assets/badges/fish.png")
var giraffe_badge = load("res://assets/badges/giraffe.png")
var koala_badge = load("res://assets/badges/koala.png")
var ladybug_badge = load("res://assets/badges/ladybug.png")
var sheep_badge = load("res://assets/badges/sheep.png")

var point_init_pos = Vector2(417, 427)

var clicked_to_open = 1

var ball_pulled = {
	"nb_clicked": 0,
	"id_item": 1
}

onready var timer = Timer.new()

var opened = false

func _ready():
	timer.set_process(true)
	set_process_input(true)
	get_node("point/clickable").connect("input_event", self, "_on_ball_input_event")
	get_node("anim_ball_falling").connect("finished", self, "_on_falling_ball_ended")
	randomize()
	pass

func _on_ball_input_event(viewport, event, shape):
	if event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.pressed:
		if ball_pulled.nb_clicked >= clicked_to_open and timer.is_active():
			ball_pulled.nb_clicked = 0
			in_use = false
			
			print("heeere")
			get_node("point/clickable/badge").hide()
			get_node("point/clickable/ball").show()
			get_node("point").set_pos(point_init_pos)
			get_node("sounds").play("picked_badge")
			timer.stop()
			
			return
		
		get_node("sounds").play("ball_clicked")
		ball_pulled.nb_clicked += 1
		get_node("point/clickable/ball").set_scale(get_node("point/clickable/ball").get_scale() + Vector2(0.01, 0.01))
		
		if ball_pulled.nb_clicked >= clicked_to_open:
			get_node("sounds").play("ball_opened")
			
			get_node("point/clickable/ball").set_scale(Vector2(1, 1))
			get_node("point/clickable/badge").show()
			get_node("point/clickable/ball").hide()
			
			timer.set_wait_time(1)
			timer.start()
			

func _on_insert_coins_pressed():
	if in_use:
		return
	
	if state_player.current_coins < price:
		get_node("sounds").play("not_enough_coins")
	else:
		in_use = true
		var color = pick_color()
		var item = pick_item()
		
		get_node("point/clickable/ball").set_texture(color)
		get_node("point/clickable/badge").set_texture(item)
		get_node("sounds").play("coins_inserted")
		
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
		
func pick_item():
	var n = randi()%items_collect+1
	ball_pulled.id_item = n
	state_player.items[n] = true
	
	if n == 1:
		return cat_badge
	elif n == 2:
		return deer_badge
	elif n == 3:
		return dragonfly_badge
	elif n == 4:
		return fish_badge
	elif n == 5:
		return giraffe_badge
	elif n == 6:
		return koala_badge
	elif n == 7:
		return ladybug_badge
	elif n == 8:
		return sheep_badge
	else:
		return koala_badge

func _on_falling_ball_ended():
	get_node("sounds").play("ball_touched_ground")
	pass