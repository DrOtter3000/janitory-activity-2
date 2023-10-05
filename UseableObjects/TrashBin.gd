extends "res://UseableObjects/Useable.gd"


var useable = false
var full = true


func _ready():
	Gamestate.number_of_trashbins += 1


func use():
	if full and useable:
		$Trashbin/Plane.visible = false
		full = false
		Gamestate.trash_collected += 1
		get_tree().call_group("GUI", "update_MissionLabel", "Pick up Trash from bins: " + str(Gamestate.number_of_trashbins - Gamestate.trash_collected))
		if Gamestate.trash_collected == Gamestate.number_of_trashbins:
			get_tree().call_group("Park", "start_phase", "container")


func update_gui():
	if full and useable:
		get_tree().call_group("GUI", "update_ActivityLabel", "(E)Use")
	else:
		get_tree().call_group("GUI", "update_ActivityLabel", "")


func make_useable():
	useable = true

