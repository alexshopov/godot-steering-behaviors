class_name Seek extends Steering

var max_acceleration: float

func _init(p_agent: Node2D, p_target: Node2D, p_max_acceleration: float):
	super(p_agent, p_target)
	max_acceleration = p_max_acceleration

# approach the target at a constant acceleration
func get_steering() -> SteeringOutput:
	var out = SteeringOutput.new()

	# direction to target and accelerate
	out.linear = (target.position - agent.position).normalized() * max_acceleration
	out.angular = 0.

	return out
