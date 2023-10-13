extends Node3D


var in_FOV = false


func _input(event):
	if event.is_action_pressed("interact"):
		if Gamestate.trap_active == true:
			$Smartphone/LblBadText.visible = true
			$Smartphone/LblGoodText.visible = false
		else:
			$Smartphone/LblBadText.visible = false
			$Smartphone/LblGoodText.visible = true
		if in_FOV:
			$AnimationPlayer.play("TakePhoneAway")
			in_FOV = !in_FOV
		else:
			$AnimationPlayer.play("TakePhone")
			in_FOV = !in_FOV
