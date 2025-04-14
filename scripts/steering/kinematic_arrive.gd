class_name KinematicArrive extends KinematicSteering

var radius: float
var time_to_target: float = 0.25

func _init(p_agent, p_max_speed, p_radius):
	super(p_agent, p_max_speed)
	radius = p_radius

func get_steering(target: Vector2) -> KinematicSteeringOutput:
	var out = KinematicSteeringOutput.new()
	if agent.position == target:
		return null

	# get direction to target
	out.velocity = target - agent.position
	if out.velocity.length() < radius:
		return null

	# move to target in time_to_target seconds
	out.velocity /= time_to_target

	# clip to max speed
	if out.velocity.length() > max_speed:
		out.velocity = out.velocity.normalized()
		out.velocity *= max_speed

	if out.velocity.length() > 0:
		out.rotation = out.velocity.angle()

	return out
