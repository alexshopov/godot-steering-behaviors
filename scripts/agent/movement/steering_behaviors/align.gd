class_name Align extends Steering

var max_rotation: float
var max_angular_acceleration: float
var target_radius: float
var slow_radius: float
var ramp_up: float = 0.1

func _init(p_agent: Node2D,
		   p_target: Node2D,
		   p_max_rotation: float,
		   p_max_angular_acceleration: float,
		   p_target_radius: float,
		   p_slow_radius: float) -> void:
	super(p_agent, p_target)
	max_rotation = p_max_rotation
	max_angular_acceleration = p_max_angular_acceleration
	target_radius = p_target_radius
	slow_radius = p_slow_radius

func get_steering() -> SteeringOutput:
	var out = SteeringOutput.new()

	# get naive direction to target
	var rotation = target.rotation - agent.rotation

	# map to (-PI, PI) interval
	rotation = wrapf(rotation, -PI, PI)
	var rotation_size = abs(rotation)

	if rotation_size < target_radius:
		return null

	var target_rotation: float
	# if outside the slow_radius use max_rotation
	if rotation_size > slow_radius:
		target_rotation = max_rotation
	else:
		target_rotation = max_rotation * (rotation_size / slow_radius)

	target_rotation *= rotation / rotation_size

	# accelerate towards the target rotation
	out.angular = (target_rotation - agent.rotation) / ramp_up

	# clamp the angular acceleration if needs be
	var alpha = abs(out.angular)
	if alpha > max_angular_acceleration:
		out.angular *= max_angular_acceleration / alpha

	out.linear = Vector2.ZERO

	return out
