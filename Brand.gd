extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func start_game():
	get_tree().change_scene_to_file("res://Themes/main_menu.tscn")
