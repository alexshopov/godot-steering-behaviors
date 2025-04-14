class_name Agent
extends CharacterBody2D

@export var speed := 200
@export var rotation_speed := 5.

var kinematic: KinematicSteering
var screen_size: Vector2
var target: Vector2 = Vector2.ZERO

func _init() -> void:
	# kinematic= KinematicSeek.new(self, speed)
	# kinematic= KinematicArrive.new(self, speed, 10)
	kinematic= KinematicWander.new(self, speed, PI)

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(&"click"):
		target = get_global_mouse_position()

func _physics_process(delta: float) -> void:
	if target == Vector2.ZERO:
		return

	var steering: KinematicSteeringOutput = kinematic.get_steering(target)
	if not steering:
		return

	velocity = steering.velocity
	rotation = lerp_angle(rotation, steering.rotation, rotation_speed * delta)

	move_and_slide()

	position.x = fposmod(position.x, screen_size.x)
	position.y = fposmod(position.y, screen_size.y)
