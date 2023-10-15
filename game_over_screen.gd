extends Node3D


func _ready():
	randomize()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _process(delta):
	$Dingo.position.x = randf_range(-0.025, 0.025)
	$Dingo.position.y = randf_range(-0.43, -0.45)


func _on_timer_timeout():
	$Camera3D/ContinueBox.visible = true


func _on_btn_quit_pressed():
	get_tree().change_scene_to_file("res://Themes/main_menu.tscn")


func _on_btn_load_checkpoint_pressed():
	pass # Replace with function body.
