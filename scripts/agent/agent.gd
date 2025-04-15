class_name Agent extends CharacterBody2D

@export var max_speed := 200
@export var rotation_speed := 5.

var kinematic: KinematicSteering
var screen_size: Vector2

#
# ---------------------------------------------------------------------------------
func _ready() -> void:
	randomize()
	reset()

#
# ---------------------------------------------------------------------------------
func _physics_process(delta: float) -> void:
	var steering: KinematicSteeringOutput = kinematic.get_steering()
	if not steering:
		return

	velocity = steering.velocity
	rotation = lerp_angle(rotation, steering.rotation, rotation_speed * delta)

	move_and_slide()

	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)

#
# ---------------------------------------------------------------------------------
func reset() -> void:
	# start at a random position and orientation within the screen bounds
	screen_size = get_viewport_rect().size
	position = Vector2(randf_range(0, screen_size.x), randf_range(0, screen_size.y))
	rotation = randf_range(0, TAU)

	# set a random initial velocity
	var angle = randf_range(0, TAU)
	velocity = Vector2.RIGHT.rotated(angle) * max_speed
