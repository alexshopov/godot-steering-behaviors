class_name BasicSeeker extends Agent

@export var target_entity: Sprite2D

func _ready() -> void:
	assert(target_entity != null)

	super()
	kinematic = KinematicSeek.new(self, target_entity.position, max_speed)

func _process(_delta: float) -> void:
	kinematic.target = target_entity.position
