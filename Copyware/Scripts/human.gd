
extends Sprite

#Declaracion de variables
var control
onready var sprite1 = preload("res://Assets/mgssoldier.png")
onready var sprite2 = preload("res://Assets/mgssoldier2.png")
func _ready():
	
	set_process(true)
	control=1
	pass

#Funcion para cambiar el estado del humano y chequear que el jugador pulse la
#tecla en el momento indicado
func _process(delta):
	if control == 1:
		set_texture(sprite1)
		#Booleano para verificar el estado del humano y determinar que el perro
		#no puede pasar
		get_parent().get_node("Doggo").check = true
	if control == -1:
		set_texture(sprite2)
		#Booleano para verificar el estado del humano y determinar que el perro
		#puede pasar
		get_parent().get_node("Doggo").check = false
	if Input.is_action_pressed("ui_accept"):
		get_parent().get_node("Doggo").movimiento = true
	pass


#Funcion del timer para cambiar el estado del humano a volteado
func _on_humanTimer_timeout():
	control = control*(-1) 
	pass # replace with function body
	



