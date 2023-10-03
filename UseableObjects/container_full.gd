extends "res://UseableObjects/Useable.gd"


func use():
	if Gamestate.trash_collected == Gamestate.number_of_trashbins:
		print("works well")
	else: 
		print("Need to collect more trash")
