extends "res://UseableObjects/Useable.gd"


func use():
	Gamestate.has_parfait = true
	if Gamestate.has_pilk and Gamestate.has_baguette:
		get_tree().call_group("Park", "start_phase", "ready_to_sacrifice")	
	queue_free()


func update_gui():
	if Gamestate.on_the_hunt:
		get_tree().call_group("GUI", "update_ActivityLabel", "(E)Grab")

