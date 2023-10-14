extends CharacterBody3D

var speed = 3

var status = "patrol"
var haunting = true
var patrol_point = Vector3.ZERO
var list_of_patrol_points = []
var lost_trail = false

@onready var nav: NavigationAgent3D = $NavigationAgent3D

var in_line_of_sight : bool
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	randomize()
	list_of_patrol_points = get_node("../PatrolPositions").get_children()
	set_new_target_point()


func _process(delta):
	if Gamestate.on_the_hunt:
		match status:
			"haunting":
				$AnimationPlayer.play("RESET")
				var player_position = get_tree().get_first_node_in_group("Player").position
				var direction = Vector3()
	
				$Dingo.look_at(player_position)
				nav.target_position = player_position
	
				direction = nav.get_next_path_position() - global_position
				direction.y = 0
				direction = direction.normalized()

				velocity = direction * (speed)
				
			
				if $Dingo/Cube_001/LineOfSightRayCasts/RayCast3D.get_collider() != null:
					if $Dingo/Cube_001/LineOfSightRayCasts/RayCast3D.get_collider().is_in_group("Player"):
						lost_trail = false
				else:
					get_back_trail()


			"patrol":
				$AnimationPlayer.play("search_mode")
				var direction = Vector3()
			
				nav.target_position = patrol_point.global_position
			
				direction = nav.get_next_path_position() - global_position
				direction.y = 0
				direction = direction.normalized()
				
				velocity = direction * (speed)
				velocity.y -= gravity * delta
			
				var look_direction = -Vector2(velocity.z, velocity.x)
				$Dingo.rotation.y = look_direction.angle()
			
				if nav.is_navigation_finished():
					set_new_target_point()
			
				look_for_player()

		
	else:
		var player_position = get_tree().get_first_node_in_group("Player").position
		$Dingo.look_at(player_position)
	
	velocity.y -= gravity * delta
	move_and_slide()
	


func look_for_player():
	for i in $Dingo/Cube_001/LineOfSightRayCasts.get_children():
		var object_in_sight: Node3D = i.get_collider()
		if object_in_sight != null:
			if object_in_sight.is_in_group("Player"):
				status = "haunting"


func set_new_target_point():
	patrol_point = list_of_patrol_points[randi_range(0, list_of_patrol_points.size()-1)]


func _on_haunting_timer_timeout():
	status = "patrol"


func get_back_trail():
	if not lost_trail:
		$HauntingTimer.start()
	lost_trail = true


func _on_dialogue_area_body_entered(body):
	if body.is_in_group("Player") and not Gamestate.on_the_hunt:
		get_tree().call_group("Park", "start_phase", "message_2")
