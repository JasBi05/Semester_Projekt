extends CharacterBody2D

const speed = 550  #Geschwindigkeit des Spielers
const jump_power = -2350 #Sprungkraft, aber warum das minus??

const acc = 50 #Wie lange man in der Luft bleibt?
const friction = 70 #Geschwindigkeit (kleine Zahl= schnell; große Zahl= langsam)

const gravity = 120 

const max_jumps = 3
var current_jumps = 1

func _physics_process(_delta):
	var input_dir: Vector2 = input()
	
	if input_dir != Vector2.ZERO:
		accelerate(input_dir)
		#play animation
	else:
		add_friction()
	player_movement()
	jump()

	 
	
func input() -> Vector2:
	var input_dir = Vector2.ZERO
	
	input_dir.x = Input.get_axis("move_left", "move_right")
	input_dir = input_dir.normalized()
	return input_dir
	

func accelerate(direction): 
	velocity = velocity.move_toward(speed * direction,acc)

func add_friction():
	velocity = velocity.move_toward(Vector2.ZERO, friction)

func player_movement():
	move_and_slide()

func jump():
	if Input.is_action_just_pressed("move_up"):
		if current_jumps < max_jumps:
			velocity.y = jump_power
			current_jumps = current_jumps + 1
	else:
		velocity.y += gravity
		if is_on_floor():
			current_jumps = 1
