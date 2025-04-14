extends Node2D

@export var wanderer: Agent
@export var seeker: Agent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(wanderer != null)
	assert(seeker != null)

	var max_speed := 200.
	var max_rotation := PI
	wanderer.set_kinematic(KinematicWander.new(wanderer, max_speed, max_rotation))

	seeker.set_kinematic(KinematicSeek.new(seeker, max_speed))

func _process(_delta: float) -> void:
	seeker.set_target(wanderer.position)
