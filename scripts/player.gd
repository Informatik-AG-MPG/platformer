extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -200


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# Das ist dasselbe wie: Input.get_action_strength("positiv") - Input.get_action_strength("negativ")
	var direction := Input.get_axis("left", "right")
	# Falls "direction" einen Wert hat, beschleunige den Spieler
	if direction:
		velocity.x = direction * SPEED
	# Falls nicht, lasse die Geschwindigkeit des Spielers langsam auf 0 fallen. (negative Beschleunigung).
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
