 
extends Node2D

var winbool 

func _ready():
	set_process(true)
	pass

func _process(delta):
	winbool = get_node("Doggo").WinMetalGearDoggo
	pass
