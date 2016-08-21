
extends Node2D

var globalvar
var timer


func _ready():
	globalvar = get_node("/root/global")
	timer = get_node("timer")
	set_process(true)
	pass

func _process(delta):
	timer.set_text(str(floor(globalvar.timer)))
	if Input.is_action_pressed("ui_select"):
		globalvar.reset_timer()
	if Input.is_action_pressed("ui_accept"):
		globalvar.sublive()

