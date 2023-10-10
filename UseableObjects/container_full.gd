extends "res://UseableObjects/Useable.gd"


var ready_to_use = false


func _process(delta):
	if Gamestate.trash_collected == Gamestate.number_of_trashbins:
		ready_to_use = true


func use():
	if ready_to_use and not Gamestate.container_used:
		get_tree().call_group("Park", "spawn_enemy")
		Gamestate.container_used = true


func update_gui():
	if ready_to_use:
		if Gamestate.container_used:
			get_tree().call_group("GUI", "update_ActivityLabel", "")
		else:
			get_tree().call_group("GUI", "update_ActivityLabel", "(E)Drop Trash")
	else:
		get_tree().call_group("GUI", "update_ActivityLabel", "Collect more Trash")


func make_useable():
	ready_to_use = true
