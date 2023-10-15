extends "res://UseableObjects/Useable.gd"


func use():
	Gamestate.has_keys = true
	get_tree().call_group("home", "change_MissionLabel")
	queue_free()


func update_gui():
	get_tree().call_group("GUI", "update_ActivityLabel", "(E)Pick Up")
