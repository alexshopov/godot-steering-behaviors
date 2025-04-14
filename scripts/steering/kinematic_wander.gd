class_name KinematicWander extends KinematicSteering

var max_rotation: float

func _init(p_agent, p_max_speed, p_max_rotation):
	super(p_agent, Vector2.ZERO, p_max_speed)
	max_rotation = p_max_rotation

func get_steering() -> KinematicSteeringOutput:
	var out = KinematicSteeringOutput.new()

	# get velocity from orientation
	out.velocity = max_speed * orientation_vector(character.rotation)

	# change it up randomly
	out.rotation = randfn(-1., 1.) * max_rotation

	return out

