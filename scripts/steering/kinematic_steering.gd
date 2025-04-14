class_name KinematicSteering

var character: CharacterBody2D
var target: Vector2
var max_speed: float

func _init(p_character, p_target, p_max_speed):
	character = p_character
	target = p_target
	max_speed = p_max_speed

# child classes will override this to implement steering behaviour
func get_steering() -> KinematicSteeringOutput:
	return null

#
# ---------------------------------------------------------------------------------
func orientation_vector(rotation) -> Vector2:
	return Vector2.RIGHT.rotated(rotation)