
extends Node2D

var rdm
var blue
var red
var green
onready var block = false
onready var winbool = false

func _ready():
	blue = preload("res://ColorMatch/Scenes/Blue.scn")
	red = preload("res://ColorMatch/Scenes/Red.scn")
	green = preload("res://ColorMatch/Scenes/Green.scn")
	set_process(true)
	get_node("Timer").start()

func _process(delta):
	if rdm == 0:
		if Input.is_action_pressed("ui_left") and block == false:
			winbool = true
			block = true
		elif Input.is_action_pressed("ui_right") and block == false:
			winbool = false
			block = true
		elif Input.is_action_pressed("ui_up") and block == false:
			winbool = false
			block = true
	elif rdm == 1:
		if Input.is_action_pressed("ui_up") and block == false:
			winbool = true
			block = true
		elif Input.is_action_pressed("ui_left") and block == false:
			winbool = false
			block = true
		elif Input.is_action_pressed("ui_right") and block == false:
			winbool = false
			block = true
	elif rdm == 2:
		if Input.is_action_pressed("ui_right") and block == false:
			winbool = true
			block = true
		elif Input.is_action_pressed("ui_left")and block == false:
			winbool = false
			block = true
		elif Input.is_action_pressed("ui_up")and block == false:
			winbool = false
			block = true
	#print(winbool)

func blu():
	var blue_instance = blue.instance()
	get_node("container").add_child(blue_instance)

func ret():
	var red_instance = red.instance()
	get_node("container").add_child(red_instance)

func gree():
	var green_instance = green.instance()
	get_node("container").add_child(green_instance)

func _on_Timer_timeout():
	randomize()
	rdm = randi()%3
	if rdm == 0:
		blu()
	elif rdm == 1:
		ret()
	else:
		gree()