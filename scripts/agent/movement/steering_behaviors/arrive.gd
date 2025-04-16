class_name Arrive extends Steering

var max_acceleration: float

var target_radius: float
var slow_radius: float

var ramp_up: float = 0.1

func _init(p_agent: Node2D,
		   p_target: Node2D,
		   p_max_speed: float,
		   p_max_acceleration: float,
		   p_target_radius: float,
		   p_slow_radius: float):
	super(p_agent, p_target)
	max_speed = p_max_speed
	max_acceleration = p_max_acceleration
	target_radius = p_target_radius
	slow_radius = p_slow_radius

# approach the target at a constant acceleration
func get_steering() -> SteeringOutput:
	var out = SteeringOutput.new()

	# get direction to target
	var direction = target.position - agent.position
	var distance = direction.length()

	# if we're within target range, then we're done
	if distance < target_radius:
		return null

	# if we are outside the target radius move at max speed towards the target
	var target_speed: float
	if distance > slow_radius:
		target_speed = max_speed	
	else:
		target_speed = max_speed * distance / slow_radius

	# combine speed and direction
	var target_velocity = direction.normalized() * target_speed

	# accelerate towards target velocity
	out.linear = (target_velocity - agent.velocity) / ramp_up

	# cap it if the acceleration is too fast
	if out.linear.length() > max_acceleration:
			out.linear = out.linear.normalized() * max_acceleration
	
	out.angular = 0.

	return out

