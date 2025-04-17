class_name BasicSeeker extends KinematicAgent

@export var target_entity: Node2D

func _ready() -> void:
	assert(target_entity != null)

	super()
	steering = KinematicSeek.new(self, target_entity, max_speed)

func _process(_delta: float) -> void:
	steering.target = target_entity