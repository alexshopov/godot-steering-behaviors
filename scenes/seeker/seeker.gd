extends Agent

@export var max_rotation: float = PI
@export var wanderer: Agent
@export var update_interval: float = 0.25

var is_seeking: bool = false
var time_accumulator: float = 0.

var kinematic_wander: KinematicWander
var kinematic_seek: KinematicSeek

func _ready() -> void:
	assert(wanderer != null)

	super()
	kinematic_wander = KinematicWander.new(self, max_speed, max_rotation)
	kinematic_seek = KinematicSeek.new(self, wanderer.position, max_speed)
	kinematic = kinematic_wander

# update target position at defined intervals
# -----------------------------------------------------------------
func _process(delta: float) -> void:
	if not is_seeking:
		return

	time_accumulator += delta
	if time_accumulator >= update_interval:
		time_accumulator = 0.0
		kinematic.target = wanderer.position


func _on_detection_area_body_entered(body:Node2D) -> void:
	if is_seeking:
		return

	if body == wanderer:
		kinematic_seek.target = wanderer.position
		kinematic = kinematic_seek
		is_seeking = true


func _draw() -> void:
	draw_circle(Vector2.ZERO, 150., Color.RED, false)
#
# ---------------------------------------------------------------------------------
func reset() -> void:
	super()
	kinematic = kinematic_wander
	is_seeking = false
