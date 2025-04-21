# steering controller base class for CharacterBody2D kinematic movement
class_name KinematicSteering

var agent: KinematicAgent2D
var target: Node2D
var max_speed: float

func _init(p_agent: KinematicAgent2D, p_target: Node2D, p_max_speed: float):
	agent = p_agent
	target = p_target
	max_speed = p_max_speed

# child classes will override this to implement steering behaviour
# ---------------------------------------------------------------------------------
func get_steering() -> SteeringOutput:
	return null

# Convert the given rotation to a vector
# ---------------------------------------------------------------------------------
func orientation_vector(rotation: float) -> Vector2:
	return Vector2.RIGHT.rotated(rotation)
