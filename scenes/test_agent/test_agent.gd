class_name TestAgent extends Agent

@export var v_target: KinematicAgent
@export var max_acceleration: float = 100.

func _ready() -> void:
	assert(v_target != null)

	randomize()
	reset()
	steering = Seek.new(self, v_target, max_acceleration)
