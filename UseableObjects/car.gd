extends "res://UseableObjects/Useable.gd"


var useable = false
var full = true



func use():
	if Gamestate.sacrified_goods:
		get_tree().change_scene_to_file("res://outro.tscn")
	elif Gamestate.at_home and Gamestate.has_keys:
		get_tree().change_scene_to_file("res://intro.tscn")
		
		


func update_gui():
	if Gamestate.at_home:
		if Gamestate.has_keys:
			print("has keys")
			get_tree().call_group("GUI", "update_ActivityLabel", "(E)Use")
		else:
			get_tree().call_group("GUI", "update_ActivityLabel", "I need the keys")
	else:
		if Gamestate.sacrified_goods:
			get_tree().call_group("GUI", "update_ActivityLabel", "(E)Use")
		else:
			get_tree().call_group("GUI", "update_ActivityLabel", "You can't leave, you have a job to do")


func make_useable():
	useable = true
