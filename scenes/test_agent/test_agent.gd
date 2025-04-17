class_name TestAgent extends Agent

@export var v_target: Node2D

@export_group("Steering - Arrive")
@export var max_acceleration: float = 500.
@export var max_speed: float = 200
@export var target_radius: float = 3
@export var slow_radius: float = 100


func _ready() -> void:
	assert(v_target != null)

	var arrive: Arrive = Arrive.new(self, v_target, max_speed, max_acceleration, target_radius, slow_radius)
	steering = arrive

	super()
