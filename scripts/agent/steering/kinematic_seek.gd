class_name KinematicSeek extends KinematicSteering

func _init(p_character: CharacterBody2D, p_target: Vector2, p_max_speed: float):
	super(p_character, p_target, p_max_speed)

func get_steering() -> KinematicSteeringOutput:
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
