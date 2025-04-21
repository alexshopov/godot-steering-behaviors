class_name KinematicArrive extends KinematicSteering

var slowing_distance: float
var ramp_down: float = 0.25

func _init(p_agent: KinematicAgent2D, p_target: Node2D, p_max_speed: float, p_slowing_distance: float):
	super(p_agent, p_target,  p_max_speed)
	slowing_distance = p_slowing_distance

func get_steering() -> SteeringOutput:
	var out = SteeringOutput.new()
	if agent.position == target.position:
		return null

	# get direction to target
	out.linear = target.position - agent.position
	if out.linear.length() < slowing_distance:
		return null

	# reduce speed within the stopping radius
	out.linear /= ramp_down

	# clip to max speed
	if out.linear.length() > max_speed:
		out.linear = out.linear.normalized() * max_speed

	# turn in the direction of travel
	if out.linear.length() > 0:
		out.angular = out.linear.angle()

	return out
