extends Node3D


func _ready():
	randomize()


func _process(delta):
	$Dingo.position.x = randf_range(-0.025, 0.025)
	$Dingo.position.y = randf_range(-0.43, -0.45)


func _on_timer_timeout():
	$Camera3D/ContinueBox.visible = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_btn_quit_pressed():
	Gamestate.checkpoint_active = false
	get_tree().change_scene_to_file("res://Themes/main_menu.tscn")


func _on_btn_load_checkpoint_pressed():
	get_tree().change_scene_to_file("res://park.tscn")
