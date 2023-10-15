extends "res://UseableObjects/door.gd"


func use():
	if Gamestate.has_flashlight:
		if interactable:
			if is_open:
				close()
			else:
				open()


func update_gui():
	if Gamestate.has_flashlight:
		get_tree().call_group("GUI", "update_ActivityLabel", "(E)Use")
	else:
		get_tree().call_group("GUI", "update_ActivityLabel", "I should pickup my flashlight")
