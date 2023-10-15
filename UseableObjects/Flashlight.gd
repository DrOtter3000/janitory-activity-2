extends "res://UseableObjects/Useable.gd"


# Called when the node enters the scene tree for the first time.
func use():
	Gamestate.has_flashlight = true
	get_tree().call_group("home", "change_MissionLabel")
	queue_free()

func update_gui():
	get_tree().call_group("GUI", "update_ActivityLabel", "(E)Pick Up")
