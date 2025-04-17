class_name KinematicSeek extends KinematicSteering

func _init(p_agent: KinematicAgent, p_target: Node2D, p_max_speed: float):
	super(p_agent, p_target, p_max_speed)

func get_steering() -> SteeringOutput:
	var out = SteeringOutput.new()
	if agent.position == target.position:
		return null

	# get direction to target and approach at max speed
	out.linear = (target.position - agent.position).normalized() * max_speed

	# orient towards the velocity vector
	if out.linear.length() > 0:
		out.angular = out.linear.angle()

	return out 
