extends Agent

@export var wanderer: Agent
@export var update_interval: float = 0.25

var time_accumulator: float = 0.

func _ready() -> void:
	assert(wanderer != null)

	super()
	kinematic = KinematicSeek.new(self, wanderer.position, max_speed)

# update target position at defined intervals
# -----------------------------------------------------------------
func _process(delta: float) -> void:
	time_accumulator += delta
	if time_accumulator >= update_interval:
		time_accumulator = 0.0
		kinematic.target = wanderer.position
