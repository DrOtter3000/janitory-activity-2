extends Control


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _on_btn_start_pressed():
	Gamestate.at_home = false
	Gamestate.has_keys = false
	Gamestate.sacrified_goods = false
	Gamestate.has_flashlight = false
	Gamestate.trap_active = true
	Gamestate.smartphone_equiped = 0
	Gamestate.has_mop = false
	Gamestate.number_of_trashbins = 0
	Gamestate.trash_collected = 0
	Gamestate.puke_left = 0
	Gamestate.container_used = false
	Gamestate.on_the_hunt = false
	Gamestate.has_parfait = false
	Gamestate.has_baguette = false
	Gamestate.has_pilk = false
	Gamestate.ready_to_sacrify = true
	Gamestate.checkpoint_active = false
	Gamestate.in_call = false
	
	get_tree().change_scene_to_file("res://home.tscn")


func _on_btn_settings_pressed():
	$Main.visible = false
	$Settings.visible = true


func _on_btn_exit_pressed():
	get_tree().quit()


func _on_check_box_pressed():
	print("Toggled On")


func _on_btn_back_pressed():
	$Settings.visible = false
	$Main.visible = true


func _on_check_box_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
