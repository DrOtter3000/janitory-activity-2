extends Node3D


@export var new_enemy : PackedScene
@export var new_baguette : PackedScene
@export var new_parfait : PackedScene
@export var new_pilk : PackedScene


func _ready():
	Gamestate.at_home = false
	Gamestate.has_flashlight = true
	start_phase("mop")
	if Gamestate.checkpoint_active:
		$Player.global_position = Vector3(-60.5, 1.373, -50.39)
		start_phase("message_1")


func _process(delta):
	if Input.is_action_just_pressed("skipjob"):
		start_phase("message_1")


func spawn_enemy():
	var enemy = new_enemy.instantiate() as Node3D
	add_child(enemy)
	enemy.global_position = $EnemySpawnLocation.position


func start_phase(phase):
	match phase:
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
		"message_1":
			$SFX.stream = load("res://SFX/Effects/545362__stwime__friendly.ogg")
			$SFX.play()
			Gamestate.in_call = true
			get_tree().call_group("GUI", "update_MissionLabel", "Press (E) to answer your phone")
			get_tree().call_group("Phone", "change_useable_status")
			Gamestate.smartphone_equiped = 2
			Gamestate.checkpoint_active = true
		"into_the_trap":
			Gamestate.in_call = false
			get_tree().call_group("GUI", "update_MissionLabel", "Meet Whiskey Dingo at the ferris wheel")
			spawn_enemy()
		"message_2":
			$SFX.stream = load("res://SFX/Effects/545362__stwime__friendly.ogg")
			$SFX.play()
			Gamestate.in_call = true
			Gamestate.trap_active = false
			get_tree().call_group("GUI", "update_MissionLabel", "Press (E) to answer your phone")
			get_tree().call_group("Phone", "change_useable_status")
			Gamestate.smartphone_equiped = 2
		"haunting":
			Gamestate.in_call = false
			Gamestate.on_the_hunt = true
			get_tree().call_group("GUI", "update_MissionLabel", "Get Pilk, Baguette and Parfait... But don't get caught")
			spawn_stuff()
		"ready_to_sacrifice":
			get_tree().call_group("GUI", "update_MissionLabel", "Sacrify the goods in the DingoDen")
		"escape":
			get_tree().call_group("GUI", "update_MissionLabel", "Reach your car and escape this place")
			

func spawn_stuff():
	$NavigationRegion3D/Attractions/AndreParfait/ParfaitUseable.visible = true
	$NavigationRegion3D/Attractions/chesterpilk/Pilk_useable.visible = true
	$NavigationRegion3D/Attractions/LuiroiBaguette/BaguetteUseable.visible = true
