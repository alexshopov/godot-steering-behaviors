class_name KinematicSeek extends KinematicSteering

func _init(p_agent: Agent, p_target: Vector2, p_max_speed: float):
	super(p_agent, p_target, p_max_speed)

func get_steering() -> KinematicSteeringOutput:
	var out = KinematicSteeringOutput.new()
	if agent.position == target:
		return null

	# get direction to target and approach at max speed
	out.velocity = (target - agent.position).normalized() * max_speed

	# orient towards the velocity vector
	if out.velocity.length() > 0:
		out.rotation = out.velocity.angle()

	return out 
