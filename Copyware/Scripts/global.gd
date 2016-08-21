extends Node

onready var score = 0 #Variable que almacena el score
onready var games = ['res://Scenes/ButtonSmasher.tscn',"res://ColorMatch/Scenes/main.scn","res://Scenes/dogger/main.scn"]#Variable que almacena los juegos

onready var lives = 4
#----------------------------------------------------------------------
func _ready():
	set_process(true)
	
func addscore():#agrega uno al score
	score += 1

func _process(delta):
	if lives < 10:
		OS.set_window_title("Welcome to Copyware")
	pass
	
	
	
func sublive():
	if lives > 0:
		lives -= 1
