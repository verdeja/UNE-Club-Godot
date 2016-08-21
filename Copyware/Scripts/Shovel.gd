
extends Sprite

# member variables here, example:
# var a=2
# var b="textvar"

#Declaracion de variables
var Movimiento_Pala
var PosOriginal
var velocidad
var control = 1

func _ready():
	set_process(true)
	PosOriginal= get_pos()
	velocidad = Vector2(0,-1000)
	pass

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		if control == 2 and get_pos().y > 14:
			PosOriginal = PosOriginal + (velocidad * delta)
			set_pos(PosOriginal)
			control = 1
		if get_pos().y < 14:
			set_pos(Vector2(10000000,100000000))
			get_parent().spriteChange = true







#Timer para hacer que la pala se detenga por medio segundo
func _on_Timer_timeout():
	control = 2
	pass # replace with function body
