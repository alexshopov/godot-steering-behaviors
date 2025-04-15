class_name WanderingAgent
extends Agent

@export var max_rotation: float = PI

func _ready() -> void:
	super()
	kinematic = KinematicWander.new(self, max_speed, max_rotation)
