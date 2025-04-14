# steering controller base class for CharacterBody2D kinematic movement
class_name KinematicSteering

var agent: CharacterBody2D
var target: Vector2
var max_speed: float

func _init(p_agent: CharacterBody2D, p_target: Vector2, p_max_speed: float):
	agent = p_agent
	target = p_target
	max_speed = p_max_speed

# child classes will override this to implement steering behaviour
# ---------------------------------------------------------------------------------
func get_steering() -> KinematicSteeringOutput:
	return null

# Convert the given rotation to a vector
# ---------------------------------------------------------------------------------
func orientation_vector(rotation: float) -> Vector2:
	return Vector2.RIGHT.rotated(rotation)
