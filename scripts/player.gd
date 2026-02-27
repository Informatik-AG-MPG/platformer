extends CharacterBody2D
@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 150.0
const JUMP_VELOCITY = -300

func _physics_process(delta: float) -> void:
	# Gravitation
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Springen
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite.play("jump")
		
	# Wird entweder 0, 1 oder -1 sein
	var direction := Input.get_axis("left", "right")
	# Animationen 
	# Sprite spiegeln
	if direction < 0:
		animated_sprite.flip_h = true
	elif direction > 0:
		animated_sprite.flip_h = false
	# Lauf-Animation
	if direction == 0 && velocity.y == 0: #&& animated_sprite.animation != "jump":
		animated_sprite.play("idle")
	elif direction != 0 && velocity.y == 0: #&& animated_sprite.animation != "jump" && animated_sprite.is_playing() == false:
		animated_sprite.play("walk")

	if direction != 0:
		velocity.x = direction * SPEED
	# Spieler Geschwindigkeit linear auf 0 fallen lassen (negative Beschleunigung).
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
