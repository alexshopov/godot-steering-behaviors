class_name Steering

var agent: Node2D
var target: Node2D

var max_speed: float

func _init(p_agent: Node2D, p_target: Node2D) -> void:
    agent = p_agent
    target = p_target

func get_steering() -> SteeringOutput:
    return null
