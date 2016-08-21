
extends Sprite

# member variables here, example:
# var a=2
# var b="textvar"
var winchange = 0
var checkwin = false


func _ready():
	if checkwin:
		set_pos(winchange)
	# Called every time the node is added to the scene.
	# Initialization here
	pass




func _on_Timer_2_timeout():
	pass # replace with function body
