class_name Agent
extends CharacterBody2D

@export var speed := 200
@export var rotation_speed := 5.

var kinematic_seek: KinematicSeek
var kinematic_arrive: KinematicArrive
var target: Vector2 = Vector2.ZERO

func _init() -> void:
	kinematic_seek = KinematicSeek.new(self, speed)
	kinematic_arrive = KinematicArrive.new(self, speed, 10)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(&"click"):
		target = get_global_mouse_position()

func _physics_process(delta: float) -> void:
	if target == Vector2.ZERO:
		return

	# var steering: KinematicSteeringOutput = kinematic_seek.get_steering(target)
	var steering: KinematicSteeringOutput = kinematic_arrive.get_steering(target)
	if not steering:
		return

	velocity = steering.velocity
	rotation = lerp_angle(rotation, steering.rotation, rotation_speed * delta)

	move_and_slide()
