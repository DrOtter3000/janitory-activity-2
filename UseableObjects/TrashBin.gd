extends "res://UseableObjects/Useable.gd"

var full = true


func _ready():
	Gamestate.number_of_trashbins += 1


func use():
	if full:
		$Trashbin/Plane.visible = false
		full = false
		Gamestate.trash_collected += 1
		print(Gamestate.trash_collected)
