class_name KinematicSeek extends KinematicSteering

var max_speed: float

func _init(p_agent, p_max_speed):
	super(p_agent)
	max_speed = p_max_speed

func get_steering(target: Vector2) -> KinematicSteeringOutput:
	var out = KinematicSteeringOutput.new()

	if agent.position == target:
		return null

	# get direction to target
	out.velocity = target - agent.position

	# the velocity along this direction at full speed
	out.velocity = out.velocity.normalized()
	out.velocity *= max_speed

	if out.velocity.length() > 0:
		out.rotation = out.velocity.angle()

	return out
