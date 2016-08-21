
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var numberpress = []
var Up = "u" 
var Down = "d"
var Left = "l" 
var Right = "r"
var Space = "s" 


func _ready():
	set_process(true)
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		print ("Space check")
	if Input.is_action_pressed("ui_up"):
		print ("Up check")
	if Input.is_action_pressed("ui_down"):
		print ("Down check")
	if Input.is_action_pressed("ui_left"):
		print ("Left check")
	if Input.is_action_pressed("ui_right"):
		print ("Right check")

func keygenerator():
	for i in range(6):
		

func testinput():
	
	pass

