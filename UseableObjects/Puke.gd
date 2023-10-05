extends "res://UseableObjects/Useable.gd"


func _ready():
	Gamestate.puke_left += 1


func use():
	if Gamestate.has_mop:
		Gamestate.puke_left -= 1
		get_tree().call_group("GUI", "update_MissionLabel", "Clean up puke: " + str(Gamestate.puke_left))
		get_tree().call_group("Mop", "animate")
		if Gamestate.puke_left <= 0:
			get_tree().call_group("Park", "start_phase", "trash")
			get_tree().call_group("Player", "drop_mop")
		queue_free()


func update_gui():
	if Gamestate.has_mop:
		get_tree().call_group("GUI", "update_ActivityLabel", "(E)Clean")
