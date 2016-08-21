
extends Sprite

# member variables here, example:
# var a=2
# var b="textvar"
var spriteChange = false


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	pass

func _process(delta):
	if spriteChange:
		set_pos(Vector2(1000000000,100000000))


