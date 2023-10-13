extends "res://UseableObjects/Useable.gd"


func use():
	Gamestate.has_keys = true
	queue_free()


func update_gui():
	get_tree().call_group("GUI", "update_ActivityLabel", "(E)Pick Up")
