
extends Node2D



func _ready():

	pass




func _on_start_pressed():
	get_tree().change_scene("res://Scenes/Controls.tscn")

func _on_quit_pressed():
	get_tree().quit()




func _on_start_mouse_enter():
	get_node("start").set_scale(Vector2(1.1,1.1))
	


func _on_start_mouse_exit():
	get_node("start").set_scale(Vector2(1,1))
	pass # replace with function body


func _on_quit_mouse_enter():
	get_node("quit").set_scale(Vector2(1.1,1.1))
	pass # replace with function body


func _on_quit_mouse_exit():
	get_node("quit").set_scale(Vector2(1,1))
	pass # replace with function body
