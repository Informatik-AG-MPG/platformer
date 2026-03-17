extends CharacterBody2D

var visible_on_screen_notifier
var left
var right
var down_left
var down_right
var top_hurtbox

var collider_velocity_y

const SPEED = 75.0
var dir

signal enemy_died

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible_on_screen_notifier = get_node("VisibleOnScreenNotifier2D")
	visible_on_screen_notifier.screen_exited.connect(_on_visible_on_screen_notifier_2d_screen_exited)

	enemy_died.connect(_on_enemy_died)

	left = get_node("RayCast2D_left")
	right = get_node("RayCast2D_right")
	down_left = get_node("RayCast2D_down_left")
	down_right = get_node("RayCast2D_down_right")
	top_hurtbox = get_node("ShapeCast2D")

	dir = 1

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	velocity.x = SPEED * dir
	if left.is_colliding() or not down_left.is_colliding():
		dir = 1
	if right.is_colliding() or not down_right.is_colliding():
		dir = -1
	move_and_slide()

	if top_hurtbox.is_colliding():
		collider_velocity_y = top_hurtbox.get_collider(0).velocity.y
		if collider_velocity_y  >= 0:
			emit_signal("enemy_died")

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_enemy_died():
	queue_free()
