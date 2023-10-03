extends "res://UseableObjects/Useable.gd"


var ready_to_use = false
var used = false


func _process(delta):
	if Gamestate.trash_collected == Gamestate.number_of_trashbins:
		ready_to_use = true


func use():
	if ready_to_use and not used:
		get_tree().call_group("Park", "spawn_enemy")
		used = true


func update_gui():
	if ready_to_use:
		if used:
			get_tree().call_group("GUI", "update_ActivityLabel", "")
		else:
			get_tree().call_group("GUI", "update_ActivityLabel", "(E)Drop Trash")
	else:
		get_tree().call_group("GUI", "update_ActivityLabel", "Collect more Trash")
