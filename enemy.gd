extends CharacterBody3D

var speed = 3

var status = "patrol"
var haunting = true
var patrol_point = Vector3.ZERO
var list_of_patrol_points = []

@onready var nav: NavigationAgent3D = $NavigationAgent3D

var in_line_of_sight : bool
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	randomize()
	list_of_patrol_points = get_node("../PatrolPositions").get_children()
	print(list_of_patrol_points)
	set_new_target_point()
	print(patrol_point)


func _process(delta):
	
	match status:
		"haunting":
			var player_position = get_tree().get_first_node_in_group("Player").position
			var direction = Vector3()
	
			$Dingo.look_at(player_position)
			nav.target_position = player_position
	
			direction = nav.get_next_path_position() - global_position
			direction.y = 0
			direction = direction.normalized()

			velocity = direction * (speed)
			velocity.y -= gravity * delta


		"patrol":
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
			

	move_and_slide()


func set_new_target_point():
	patrol_point = list_of_patrol_points[randi_range(0, list_of_patrol_points.size()-1)]


