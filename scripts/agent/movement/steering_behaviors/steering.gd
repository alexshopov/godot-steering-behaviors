class_name Steering

var max_speed: float
var target: Node2D

var agent: Node2D

func _init(p_agent: Node2D, p_target: Node2D) -> void:
    agent = p_agent
    target = p_target

func get_steering() -> SteeringOutput:
    return null
