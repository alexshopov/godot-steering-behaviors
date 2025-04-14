class_name KinematicSteering

var agent: Agent
var max_speed: float

func _init(p_agent, p_max_speed):
    agent = p_agent
    max_speed = p_max_speed

# child classes will override this to implement steering behaviour
func get_steering(_target: Vector2) -> KinematicSteeringOutput:
    return null
