extends CharacterBody2D

enum PlayerState {
	IDLE,
	WALKING,
	JUMPING
}

const GRAVITY        = 200
const SPEED          = 100
const JUMP_POWER     = 200
const UP_VECTOR      = Vector2(0, -1)

var current_state: PlayerState = PlayerState.IDLE
@onready var walk_sound: AudioStreamPlayer = $Walk  # Verwende onready für eine sichere Initialisierung

func _ready():
	pass 

func _process(delta):
	match current_state:
		PlayerState.IDLE:
			idle_state(delta)
		PlayerState.WALKING:
			walking_state(delta)
		PlayerState.JUMPING:
			jumping_state(delta)

	if is_on_ceiling() or is_on_floor():
		velocity.y  = 0

	velocity.y += GRAVITY * delta

	move_and_slide()

func idle_state(delta):
	velocity.x = 0
	if is_on_floor():
		velocity.y = 0

	check_key_input()

func walking_state(delta):
	if is_on_floor():
		velocity.y = 0

	check_key_input()

	if is_on_floor() and (Input.is_action_pressed("left") or Input.is_action_pressed("right")):
		if not walk_sound.playing:
			walk_sound.play()
	else:
		walk_sound.stop()

func jumping_state(delta):
	velocity.x = 0
	velocity.y += GRAVITY * delta

	check_key_input()

	# Hier wurde die Bedingung aktualisiert, um sicherzustellen, dass der Sound nur während des Sprungs abgespielt wird
	if not is_on_floor():
		if not $Jump.playing:
			$Jump.play()

	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = -JUMP_POWER
			set_state(PlayerState.JUMPING)
		else:
			set_state(PlayerState.IDLE)

func check_key_input():
	velocity.x = 0  # Setze die Geschwindigkeit auf null zuerst

	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
		set_state(PlayerState.WALKING)
	elif Input.is_action_pressed("right"):
		velocity.x = SPEED
		set_state(PlayerState.WALKING)

	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = -JUMP_POWER
			if not $Jump.playing:
				$Jump.play()
			set_state(PlayerState.JUMPING)
		else:
			set_state(PlayerState.IDLE)

func set_state(new_state: PlayerState):
	if current_state != new_state:
		current_state = new_state
