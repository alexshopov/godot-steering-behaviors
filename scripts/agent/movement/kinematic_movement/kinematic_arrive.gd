class_name KinematicArrive extends KinematicSteering

var slowing_distance: float
var ramp_down: float = 0.25

func _init(p_agent: Agent, p_target: Vector2, p_max_speed: float, p_slowing_distance: float):
	super(p_agent, p_target,  p_max_speed)
	slowing_distance = p_slowing_distance

func get_steering() -> KinematicSteeringOutput:
	var out = KinematicSteeringOutput.new()
	if agent.position == target:
		return null

	# get direction to target
	out.velocity = target - agent.position
	if out.velocity.length() < slowing_distance:
		return null

	# reduce speed within the stopping radius
	out.velocity /= ramp_down

	# clip to max speed
	if out.velocity.length() > max_speed:
		out.velocity = out.velocity.normalized() * max_speed

	# turn in the direction of travel
	if out.velocity.length() > 0:
		out.rotation = out.velocity.angle()

	return out
