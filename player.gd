extends CharacterBody3D


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var speed = 5
var jump_speed = 5
var mouse_sensitivity = 0.002

#CamBob
var direction = Vector3.ZERO
var _delta = 0.0
var cb_speed = 7
var cb_height = 0.1
@onready var camera = $Camera3D
@onready var cameraPos :Vector3 = camera.position

#Ground detection
var noiseFootstep = 0.0
var numberOfFootsteps = 3
var running = false


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _physics_process(delta):
	movement(delta)


func _process(delta):
	cambob(delta)
	handle_ground()


func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Camera3D.rotate_x(-event.relative.y * mouse_sensitivity)
		$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(60), deg_to_rad(65))


func movement(delta):
	velocity.y += -gravity * delta
	var input = Input.get_vector("left", "right", "forward", "back")
	var movement_dir = transform.basis * Vector3(input.x, 0, input.y)
	velocity.x = movement_dir.x * speed
	velocity.z = movement_dir.z * speed

	move_and_slide()
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed
	
	direction = movement_dir


func cambob(delta):
	_delta += delta
	
	var cam_bob
	if direction != Vector3.ZERO:
		cam_bob = floor (abs(direction.z) + abs(direction.x)) * _delta * cb_speed
	else:
		cam_bob = _delta * cb_speed * 0.25
	
	var objCam = cameraPos + Vector3.UP * sin(cam_bob) * cb_height
	camera.position = camera.position.lerp(objCam, delta)


func handle_ground():
	if $GroundDetectionRayCast.is_colliding():
		var terrain = $GroundDetectionRayCast.get_collider().get_parent()
		if terrain != null and terrain.get_groups().size() > 0:
			var terraingroup = terrain.get_groups()[0]
			walking_sounds(terraingroup)


func walking_sounds(group : String):
	if (int(velocity.x) != 0) || (int(velocity.z != 0)):
		noiseFootstep += 0.1
	
	if noiseFootstep > numberOfFootsteps and is_on_floor():
		match group:
			"WoodenFloor":
				$FootstepsSFX.stream = load("res://SFX/Effects/WoodenFloorWalk.ogg")
		
		$FootstepsSFX.pitch_scale = randf_range(0.8, 1.2)
		$FootstepsSFX.play()
		noiseFootstep = 0.0
