class_name Flee extends Seek

# move as far away from the target as possible
func get_steering() -> SteeringOutput:
	var out = SteeringOutput.new()

	# direction to target and accelerate
	out.linear = (agent.position - target.position).normalized() * max_acceleration
	out.angular = 0.

	return out
