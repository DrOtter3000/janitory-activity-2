extends Sprite2D


var credits_started = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if credits_started:
		position.y -= .15


func start_credits():
	credits_started = true
