class_name TestAgent extends Agent

@export var v_target: Node2D
@export var update_interval: float = 0.

@export_group("Steering - Align")
@export var max_rotation: float = 500.
@export var max_angular_acceleration: float = 200
@export var target_radius: float = 3
@export var slow_radius: float = 100

var time_accumulator: float = 0.

func _ready() -> void:
	assert(v_target != null)

	var align: Align = Align.new(self, v_target, max_rotation, max_angular_acceleration, target_radius, slow_radius)
	steering = align

	super()

func _process(delta: float) -> void:
	time_accumulator += delta
	if time_accumulator >= update_interval:
		time_accumulator = 0.0
		steering.target = v_target
