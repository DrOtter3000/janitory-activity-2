extends "res://UseableObjects/Useable.gd"


func use():
	if Gamestate.trash_collected == Gamestate.number_of_trashbins:
		get_tree().call_group("Park", "spawn_enemy")
	else: 
		print("Need to collect more trash")
