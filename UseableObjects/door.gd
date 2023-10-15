extends "res://UseableObjects/Useable.gd"


var is_open = false
var interactable = true


func use():
	if interactable:
		if is_open:
			close()
		else:
			open()


func close():
	is_open = false
	interactable = false
	$AnimationPlayer.play("close_door")


func open():
	is_open = true
	interactable = false
	$AnimationPlayer.play("door_open")


func _on_animation_player_animation_finished(anim_name):
	interactable = true
