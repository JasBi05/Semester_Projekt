extends CharacterBody2D

const GRAVITY 		= 200
const SPEED 		= 100
const JUMP_POWER 	= 200
const UP_VECTOR 	= Vector2(0,-1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x = 0
	
	if is_on_ceiling() or is_on_floor():
		velocity.y  = 0
	
	velocity.y += GRAVITY * delta
	
	check_key_input()
	
	move_and_slide()


func check_key_input():
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
	
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_POWER
