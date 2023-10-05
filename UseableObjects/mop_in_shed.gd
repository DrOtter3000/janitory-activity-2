extends "res://UseableObjects/Useable.gd"


func use():
	Gamestate.has_mop = true
	get_tree().call_group("Player", "take_mop")
	get_tree().call_group("Park", "start_phase", "puke")
	queue_free()


func update_gui():
	get_tree().call_group("GUI", "update_ActivityLabel", "(E)Grab")

