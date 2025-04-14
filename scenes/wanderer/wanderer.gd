extends Agent

@export var max_rotation: float = PI / 2

func _ready() -> void:
	super()
	kinematic = KinematicWander.new(self, max_speed, max_rotation)
