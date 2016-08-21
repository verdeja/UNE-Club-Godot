
extends Node2D

var global
var game
var loadedgame
var lobbyGui
var loadedgamebool
var sound
var music

func _ready():
	sound = get_node("sounds")
	music = get_node("music")
	global = get_node("/root/global")#Loads global Variables
	set_process(true)#Activates procces
	get_node("timers/beforeGame").start()#Starts the timer 
	lobbyGui = get_node("lobbyGui")#Gets the Gui Scene
	#Sets the lives and the score to the global variables
	get_node("lobbyGui/lives").set_text(str("Lives: ",global.lives))
	get_node("lobbyGui/score").set_text(str("Score: ",global.score))
	get_node("gui/timer").set_opacity(0)
	sound.play("hereWeGo")
	music.play(0)
	


func loadgame():
	randomize()#Gets a random seed
	var rand = rand_range(0,3)#pass a random number to the variable rand
	game = load(global.games[rand])#loads a random game scene from a list using rand
	#pass the instance of the scene to the variable gameInstance
	var gameInstance = game.instance() 
	#pass the instance to the variable loadedGame (used later to queue free the scene lmao)
	loadedgame = gameInstance
	add_child(gameInstance)#Adds the scene to the main scene as a child
	sound.play("letsGo")

#Unloads the game when the time runs out
func unloadGame():
	if loadedgame:#Checks if the variable exist (No first time running it)
		if loadedgame.winbool:#Checks if the player have won the game
			loadedgamebool = true#Variable to add points to the score
			sound.play("ohRight")
		elif !loadedgame.winbool:#Checks if the player have lose the game
			loadedgamebool = false#Variable to subtract points to the score
			sound.play("Ohno")
		loadedgame.queue_free()#Erase the games from the memory
	

func _process(delta):
	#Updates the timers during and before game
	get_node("gui/timer").set_text(str(round(get_node("timers/duringGame").get_time_left())))
	get_node("lobbyGui/timelobby").set_text(str(round(get_node("timers/beforeGame").get_time_left())))
	



func _on_beforeGame_timeout():
	music.stop()
	lobbyGui.set_opacity(0)#Hides the Gui
	get_node("gui/timer").set_opacity(1)
	loadgame()#Loads a game
	if global.score%5 == 0 :#Si el modulo de 5 con el score es cero se aumenta el tiempo
		get_node("timers/duringGame").set_wait_time(get_node("timers/duringGame").get_wait_time()-0.6)
	get_node("timers/duringGame").start()#Comienza el timer duringgame
	


func _on_duringGame_timeout():
	unloadGame()#Unloads the game
	if loadedgamebool:
		get_node("lobbyGui/winLose").set_text("YOU WIN")
		global.score += 1
		get_node("lobbyGui/score").set_text(str("Score: ",global.score))
	else:
		get_node("lobbyGui/winLose").set_text("YOU LOSE")
		global.lives -= 1
		get_node("lobbyGui/lives").set_text(str("Lives: ",global.lives))
	lobbyGui.set_opacity(1)
	get_node("gui/timer").set_opacity(0)
	get_node("timers/beforeGame").start()
	music.play(0)
	

	
	


func _on_Quit_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	pass # replace with function body
