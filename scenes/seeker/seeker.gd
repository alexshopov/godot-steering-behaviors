class_name SeekerAgent
extends KinematicAgent

@export var max_rotation: float = PI
@export var update_interval: float = 0.25

var current_target: KinematicAgent
var kinematic: KinematicSteering
var kinematic_seek: KinematicSeek
var kinematic_wander: KinematicWander
var is_seeking: bool = false
var time_accumulator: float = 0.

func _ready() -> void:
	super()
	kinematic_wander = KinematicWander.new(self, max_speed, max_rotation)
	kinematic_seek = KinematicSeek.new(self, null, max_speed)
	kinematic = kinematic_wander

# update target position at defined intervals
# -----------------------------------------------------------------
func _process(delta: float) -> void:
	if is_seeking:
		time_accumulator += delta
		if time_accumulator >= update_interval:
			time_accumulator = 0.0
			kinematic.target = current_target


func _on_detection_area_body_entered(body:Node2D) -> void:
	if not is_seeking and body.is_in_group("wanderers"):
			current_target = body
			kinematic_seek.target = current_target
			kinematic = kinematic_seek
			is_seeking = true

func _on_detection_area_body_exited(body:Node2D) -> void:
	if is_seeking and body == current_target:
			current_target = null
			kinematic = kinematic_wander
			is_seeking = false
	

func _draw() -> void:
	draw_circle(Vector2.ZERO, 150., Color.RED, false)

#
# ---------------------------------------------------------------------------------
func reset() -> void:
	super()
	kinematic = kinematic_wander
	is_seeking = false

