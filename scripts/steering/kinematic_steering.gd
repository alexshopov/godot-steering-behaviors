class_name KinematicSteering

var agent: Agent

func _init(p_agent):
    agent = p_agent

# child classes will override this to implement steering behaviour
func get_steering(_target: Vector2) -> KinematicSteeringOutput:
    return null
