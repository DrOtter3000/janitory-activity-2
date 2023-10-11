extends Node3D


@export var new_enemy : PackedScene


func _ready():
	start_phase("mop")


func _process(delta):
	pass
			


func spawn_enemy():
	var enemy = new_enemy.instantiate() as Node3D
	add_child(enemy)
	enemy.global_position = $EnemySpawnLocation.position


func start_phase(str):
	match str:
		"mop":
			get_tree().call_group("GUI", "update_MissionLabel", "Go to the janitors shed and pick up the mop")
		"puke":
			get_tree().call_group("GUI", "update_MissionLabel", "Clean up puke: " + str(Gamestate.puke_left))
		"trash":
			get_tree().call_group("GUI", "update_MissionLabel", "Pick up Trash from bins: " + str(Gamestate.number_of_trashbins - Gamestate.trash_collected))
			get_tree().call_group("Trashbin", "make_useable")
		"container":
			get_tree().call_group("GUI", "update_MissionLabel", "Bring the trash to the container")
			get_tree().call_group("Container", "activate_container")
			get_tree().call_group("Container", "make_useable")
