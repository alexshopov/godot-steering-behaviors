class_name SeekerAgent extends KinematicAgent

@export var max_rotation: float = PI
@export var update_interval: float = 0.25

var current_target: KinematicAgent
var seek: KinematicSeek
var wander: KinematicWander
var is_seeking: bool = false
var time_accumulator: float = 0.

func _ready() -> void:
	super()
	wander = KinematicWander.new(self, max_speed, max_rotation)
	seek = KinematicSeek.new(self, null, max_speed)
	steering = wander

func _process(delta: float) -> void:
	if is_seeking:
		# update target position at defined intervals
		time_accumulator += delta
		if time_accumulator >= update_interval:
			time_accumulator = 0.0
			steering.target = current_target


func _on_detection_area_body_entered(body: Node2D) -> void:
	if not is_seeking and body.is_in_group("wanderers"):
		_update_steering(seek, body)

func _on_detection_area_body_exited(body: Node2D) -> void:
	if is_seeking and body == current_target:
		_update_steering(wander)
	
func _update_steering(new_steering: KinematicSteering, new_target: KinematicAgent = null):
	current_target = new_target 

	steering = new_steering
	if new_steering == seek:
		steering.target = current_target
		
	is_seeking = !is_seeking

# draw the seeker's search radius
# ---------------------------------------------------------------------------------
func _draw() -> void:
	draw_circle(Vector2.ZERO, 150., Color.RED, false)

#
# ---------------------------------------------------------------------------------
func reset() -> void:
	super()
	steering = wander
	is_seeking = false
