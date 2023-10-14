extends Node3D


var in_FOV = false
var useable = false


func _input(event):
	if event.is_action_pressed("interact") and useable and Gamestate.smartphone_equiped > 0:
		if Gamestate.trap_active == true:
			$Smartphone/LblBadText.visible = true
			$Smartphone/LblGoodText.visible = false
		else:
			$Smartphone/LblBadText.visible = false
			$Smartphone/LblGoodText.visible = true
		Gamestate.smartphone_equiped -= 1
		if Gamestate.smartphone_equiped == 0:
			if Gamestate.trap_active: 
				get_tree().call_group("Park", "start_phase", "into_the_trap")
				change_useable_status()
			else:
				get_tree().call_group("Park", "start_phase", "haunting")

		if in_FOV:
			$AnimationPlayer.play("TakePhoneAway")
			in_FOV = !in_FOV
		else:
			$AnimationPlayer.play("TakePhone")
			in_FOV = !in_FOV


func change_useable_status():
	useable = !useable
