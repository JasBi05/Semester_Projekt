extends CharacterBody2D

class_name Player

enum PlayerState {
	IDLE,
	WALKING,
	JUMPING
}

const GRAVITY        = 250
const SPEED          = 100
const JUMP_POWER     = 190
const UP_VECTOR      = Vector2(0, -1)
const ACCELERATION   = 70

var current_state: PlayerState = PlayerState.IDLE
var is_walking: bool = false
var spawner = null
var velo = Vector2.ZERO
var colliding_ladder = false
var going_up = false

@onready var walk_sound: AudioStreamPlayer = $Walk
#@onready var animation = $AnimationPlayer

func _ready():
	Respawn.player = self

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

	check_key_input()

	move_and_slide()
	
	
	if position.y >= 600:
		die()
	if !going_up:
		velo.y += GRAVITY
		climb()

func idle_state(_delta):
	velocity.x = 0
	if is_on_floor():
		velocity.y = 0

	check_key_input()

func walking_state(_delta):
	if (is_on_floor() or is_on_ceiling()) and (Input.is_action_pressed("left") or Input.is_action_pressed("right")):
		# Hier kannst du den Sound abspielen, wenn im WALKING-Zustand
		if $Walk.playing == false:
			$Walk.play()
	else:
		$Walk.stop()

	# Überprüfe, ob der Spieler auf dem Boden steht und keine Richtungstaste mehr drückt
	if is_on_floor() and not Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		$Walk.stop()



func jumping_state(delta):
	velocity.x = 0
	velocity.y += GRAVITY * delta

	check_key_input()


func check_key_input():
	velocity.x = 0  # Setze die Geschwindigkeit auf null zuerst
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
		set_state(PlayerState.WALKING)
		is_walking = true
	elif Input.is_action_pressed("right"):
		velocity.x = SPEED
		set_state(PlayerState.WALKING)
		is_walking = true
	else:
		set_state(PlayerState.IDLE)
		is_walking = false
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = -JUMP_POWER
			if $Jump.playing == false:
				$Jump.play()
				#animation.play("jump")
				set_state(PlayerState.JUMPING)
			else:
				set_state(PlayerState.IDLE)

func set_state(new_state: PlayerState):
	if current_state != new_state:
		current_state = new_state
		
		
func die():
	Respawn.respawn_player()
	print("Player died. Respawn function called.")



func climb():
	if colliding_ladder:
		if Input.is_action_just_pressed("up"):
			going_up = true
			velo.y = max(velo.y - ACCELERATION, -SPEED)





func _on_area_2d_area_entered(area):
	area.get_name()
	if area.is_in_group("ladder"):
		colliding_ladder = true
		print("YES")


func _on_area_2d_area_exited(area):
	area.get_name()
	if area.is_in_group("ladder"):
		colliding_ladder = false
		going_up = false
		print("NO")
