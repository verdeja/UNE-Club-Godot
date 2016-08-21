#Ranita cruzando la calle

extends Node2D

onready var boolDownUp = true
onready var boolDownDown = true
onready var boolDownRight = true
onready var boolDownLeft = true
onready var boolDownSpace = true
onready var auxButton = 'z'
onready var xSpawn = 20
onready var ySpawn = -50
onready var buttonList = []
onready var spawnList = []
onready var winbool = false
onready var losebool = false

onready var arrowScene = preload("res://Scenes/ButtonSmasherScenes/Arrow.tscn")
onready var arrowSceneDown = preload("res://Scenes/ButtonSmasherScenes/ArrowDown.tscn")
onready var arrowSceneRight = preload("res://Scenes/ButtonSmasherScenes/ArrowRight.tscn")
onready var arrowSceneLeft = preload("res://Scenes/ButtonSmasherScenes/ArrowLeft.tscn")
onready var spaceScene = preload("res://Scenes/ButtonSmasherScenes/space.tscn")
func _ready():
	set_process(true)
	spawner()
	
	pass
	
func _process(delta):
	detect()
	#print(spawnList, " ", buttonList)

func spawner():
	for i in range(2):
		ySpawn += 230
		xSpawn = 20
		for x in range(3):
			randomize()
			var random = randi()%5
			if random == 0:
				xSpawn += 170
				var node = arrowScene.instance()
				add_child(node)
				node.set_pos(Vector2(xSpawn,ySpawn))
				spawnList.append(node)
				buttonList.append("u")
			if random == 1:
				xSpawn += 170
				var node = arrowSceneDown.instance()
				add_child(node)
				node.set_pos(Vector2(xSpawn,ySpawn))
				spawnList.append(node)
				buttonList.append("d")
			if random == 2:
				xSpawn += 170
				var node = arrowSceneRight.instance()
				add_child(node)
				node.set_pos(Vector2(xSpawn,ySpawn))
				spawnList.append(node)
				buttonList.append("r")
			if random == 3:
				xSpawn += 170
				var node = arrowSceneLeft.instance()
				add_child(node)
				node.set_pos(Vector2(xSpawn,ySpawn))
				spawnList.append(node)
				buttonList.append("l")
			if random == 4:
				xSpawn += 170
				var node = spaceScene.instance()
				add_child(node)
				node.set_pos(Vector2(xSpawn,ySpawn))
				spawnList.append(node)
				buttonList.append("s")

func detect():
	button_press()
	if buttonList.size() > 0 and !losebool:
		if auxButton != 'z':
				if auxButton == buttonList[0]:
					var auxnode = spawnList[0]
					auxnode.queue_free()
					spawnList.pop_front()
					buttonList.pop_front()
				else:
					losebool = true
					winbool = false
					get_node("Label").set_text("YOU LOSER! DUMB FUCK")
	elif !losebool:
		winbool = true
		get_node("Label").set_text("YOU WIN!")
	pass




func button_press():
	if !boolDownUp:
		auxButton = "z"
	if !boolDownDown:
		auxButton = "z"
	if !boolDownRight:
		auxButton = "z"
	if !boolDownLeft:
		auxButton = "z"
	if !boolDownSpace:
		auxButton = "z"
	if Input.is_action_pressed("ui_up") and boolDownUp:
		auxButton = "u"
		boolDownUp = false
	elif !Input.is_action_pressed("ui_up") and !boolDownUp:
		auxButton = "z"
		boolDownUp = true
	if Input.is_action_pressed("ui_down") and boolDownDown:
		auxButton = "d"
		boolDownDown = false
	elif !Input.is_action_pressed("ui_down") and !boolDownDown:
		auxButton = "z"
		boolDownDown = true
	if Input.is_action_pressed("ui_right") and boolDownRight:
		auxButton = "r"
		boolDownRight = false
	elif !Input.is_action_pressed("ui_right") and !boolDownRight:
		auxButton = "z"
		boolDownRight = true
	if Input.is_action_pressed("ui_left") and boolDownLeft:
		auxButton = "l"
		boolDownLeft= false
	elif !Input.is_action_pressed("ui_left") and !boolDownLeft:
		auxButton = "z"
		boolDownLeft = true
	if Input.is_action_pressed("ui_select") and boolDownSpace:
		auxButton = "s"
		boolDownSpace= false
	elif !Input.is_action_pressed("ui_select") and !boolDownSpace:
		auxButton = "z"
		boolDownSpace = true
	return auxButton

