class_name KinematicSeek extends KinematicSteering

func _init(p_character, p_target, p_max_speed):
	super(p_character, p_target, p_max_speed)

func get_steering() -> KinematicSteeringOutput:
	var out = KinematicSteeringOutput.new()

	if character.position == target:
		return null

	# get direction to target
	out.velocity = target - character.position

	# the velocity along this direction at full speed
	out.velocity = out.velocity.normalized()
	out.velocity *= max_speed

	if out.velocity.length() > 0:
		out.rotation = out.velocity.angle()

	return out
