class_name WanderingAgent extends KinematicAgent2D

@export var max_rotation: float = PI

func _ready() -> void:
	super()
	steering = KinematicWander.new(self, max_speed, max_rotation)
