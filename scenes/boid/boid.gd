class_name Boid
extends CharacterBody2D

@export var human_control := true
@export var speed := 400
@export var rotation_speed := 1.5
@export var separation := 100

var leader := Vector2.ZERO
var target := Vector2.ZERO

@onready var screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
    if human_control:
        _handle_player_input(delta)
    else:
        _seek_target()

    move_and_slide()

    # screen wrap
    position.x = wrapf(position.x, 0, screen_size.x)
    position.y = wrapf(position.y, 0, screen_size.y)

func _process(_delta: float) -> void:
    if not human_control:
        var players = get_tree().get_nodes_in_group("player")
        if (players.size() > 0):
            leader = players[0].position

func _handle_player_input(delta: float):
    var rotation_direction = Input.get_axis("left", "right")
    velocity = transform.x * speed
    rotation += rotation_direction * rotation_speed * delta

func _input(event):
    if event.is_action_pressed(&"click"):
        target = get_global_mouse_position()

# kinetmatic movement algorithms
# ---------------------------------------------------------------------------
func _seek_target () -> void:
    velocity = Vector2.ZERO
    if leader and position.distance_to(leader) > separation:
        velocity = position.direction_to(leader) * speed
        look_at(leader)
