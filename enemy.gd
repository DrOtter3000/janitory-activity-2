extends CharacterBody3D

var speed = 1
var haunting = true

@onready var nav: NavigationAgent3D = $NavigationAgent3D


var in_line_of_sight : bool
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _process(delta):
	
	
	if haunting:
		
		if not in_line_of_sight:
			var player_position = get_tree().get_first_node_in_group("Player").position
			var direction = Vector3()
	
			$Body.look_at(player_position)
			nav.target_position = player_position
	
			direction = nav.get_next_path_position() - global_position
			direction.y = 0
			direction = direction.normalized()
		
			velocity = direction * (speed)
			velocity.y -= gravity * delta
		
			move_and_slide()


func _on_visible_on_screen_notifier_3d_screen_entered():
	in_line_of_sight = true


func _on_visible_on_screen_notifier_3d_screen_exited():
	in_line_of_sight = false


func _on_kill_area_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://game_over_screen.tscn")
