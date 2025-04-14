class_name Agent
extends CharacterBody2D

@export var max_speed := 200
@export var rotation_speed := 5.

var kinematic: KinematicSteering
var screen_size: Vector2
var target: Vector2

func _ready() -> void:
	randomize()

	# start at a random position and orientation within the screen bounds
	screen_size = get_viewport_rect().size
	position = Vector2(randf_range(0, screen_size.x), randf_range(0, screen_size.y))
	rotation = randf_range(0, TAU)

	# set a random initial velocity
	var angle = randf_range(0, TAU)
	velocity = Vector2.RIGHT.rotated(angle) * max_speed

	# set initial target
	target = screen_size / 2

	# kinematic steering behaviors
	# kinematic= KinematicSeek.new(self, max_speed)

	# var radius := 10.
	# kinematic = KinematicArrive.new(self, max_speed, radius)

	var max_rotation := PI
	kinematic = KinematicWander.new(self, max_speed, max_rotation)

func set_kinematic(p_kinematic: KinematicSteering) -> void:
	kinematic = p_kinematic

func set_target(p_target: Vector2) -> void:
	target = p_target

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(&"click"):
		target = get_global_mouse_position()

func _physics_process(delta: float) -> void:
	var steering: KinematicSteeringOutput = kinematic.get_steering(target)
	if not steering:
		return

	velocity = steering.velocity
	rotation = lerp_angle(rotation, steering.rotation, rotation_speed * delta)

	move_and_slide()

	position.x = fposmod(position.x, screen_size.x)
	position.y = fposmod(position.y, screen_size.y)

func orientation_vector() -> Vector2:
	return Vector2.RIGHT.rotated(rotation)
