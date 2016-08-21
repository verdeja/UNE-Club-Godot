
extends Sprite

# member variables here, example:
# var a=2
# var b="textvar"
var posOriginal 
var velocidad
var colision = 1

func _ready():
	set_process(true)
	posOriginal = get_pos()
	velocidad = Vector2(170,0)
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		posOriginal = posOriginal + ((-1*velocidad) * delta)
		set_pos(posOriginal)
	if Input.is_action_pressed("ui_right"):
		posOriginal = posOriginal + (velocidad * delta)
		set_pos(posOriginal)
	if get_pos().x == 332 or get_pos().x == 460:
		velocidad = Vector2(0,0)


