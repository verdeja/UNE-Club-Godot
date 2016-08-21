
extends Sprite

var posOriginal 
var velocidad
var movimiento = false
var check = false 
var WinMetalGearDoggo = false
var sound = 0

func _ready():
	posOriginal = get_pos()
	velocidad = Vector2(400,0)
	set_process(true)
	sound = false
	
	pass

func _process(delta):
	if get_pos().x > 600:
		velocidad = Vector2(0,0)
		WinMetalGearDoggo = true
	if movimiento:
		posOriginal = posOriginal + (velocidad * delta)
		set_pos(posOriginal)
	#Si el booleano de check esta en true, el perro se detiene
	if check and sound == 0:
		if get_pos().x >= 300 and get_pos().x <= 450:
			velocidad = Vector2(0,0)
			get_parent().get_node("discorvered").set_pos(Vector2(self.get_pos().x,self.get_pos().y-200))
			sound = 1
	if sound == 1 :
		get_parent().get_node("sound").play("exclamation")
		
		sound = 2
	pass
