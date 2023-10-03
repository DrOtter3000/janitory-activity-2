extends StaticBody3D
class_name Useables

func use():
	pass


func update_gui():
	get_tree().call_group("GUI", "update_ActivityLabel", "(E)Use")
