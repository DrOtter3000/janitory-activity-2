extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Gamestate.at_home = true
	get_tree().call_group("GUI", "update_MissionLabel", "Pick up the flashlight")


func change_MissionLabel():
	print("change")
	if Gamestate.has_keys:
		get_tree().call_group("GUI", "update_MissionLabel", "Drive to work")
	else:
		get_tree().call_group("GUI", "update_MissionLabel", "Go to the garage and pick up keys")
			
			
