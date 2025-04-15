class_name KinematicWander extends KinematicSteering

var max_rotation: float

func _init(p_agent: KinematicAgent, p_max_speed: float, p_max_rotation: float):
	super(p_agent, Vector2.ZERO, p_max_speed)
	max_rotation = p_max_rotation

func get_steering() -> SteeringOutput:
	var out = SteeringOutput.new()

	# get velocity from orientation
	out.linear = max_speed * orientation_vector(agent.rotation)

	# change it up randomly
	out.angular = randfn(-1., 1.) * max_rotation

	return out

