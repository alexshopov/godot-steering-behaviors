class_name KinematicWander extends KinematicSteering

var max_rotation: float

func _init(p_agent: Agent, p_max_speed: float, p_max_rotation: float):
	super(p_agent, Vector2.ZERO, p_max_speed)
	max_rotation = p_max_rotation

func get_steering() -> KinematicSteeringOutput:
	var out = KinematicSteeringOutput.new()

	# get velocity from orientation
	out.velocity = max_speed * orientation_vector(agent.rotation)

	# change it up randomly
	out.rotation = randfn(-1., 1.) * max_rotation

	return out

