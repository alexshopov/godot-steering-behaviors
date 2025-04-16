class_name Agent extends CharacterBody2D

@export var rotation_speed := 5.

var steering: Steering
var screen_size: Vector2

#
# ---------------------------------------------------------------------------------
func _ready() -> void:
	assert(steering != null)

	randomize()
	reset()

#
# ---------------------------------------------------------------------------------
func _physics_process(delta: float) -> void:
	var steering_out: SteeringOutput = steering.get_steering()
	if not steering_out:
		return

	velocity += steering_out.linear * delta
	if velocity.length() > steering.max_speed:
		velocity = velocity.normalized() * steering.max_speed

	move_and_slide()

	if screen_size == Vector2.ZERO:
		screen_size = get_viewport_rect().size

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
	velocity = Vector2.RIGHT.rotated(angle) * steering.max_speed
