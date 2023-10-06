extends Control




func _on_btn_start_pressed():
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
