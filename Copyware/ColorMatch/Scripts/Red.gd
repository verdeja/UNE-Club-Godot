
extends Sprite

var block

func _ready():
	block = false
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("ui_up") and block == false:
		queue_free()
		block = true
	elif Input.is_action_pressed("ui_left") and block == false:
		block = true
	elif Input.is_action_pressed("ui_right") and block == false:
		block = true
	else:
		pass