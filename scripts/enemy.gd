extends CharacterBody2D

var run_speed = 25
var player = null

func _physics_process(_delta):
	velocity = Vector2.ZERO
	if player:
		velocity = position.direction_to(player.position) * run_speed
	move_and_slide()

func _on_DetectRadius_body_entered(body):
	player = body

func _on_DetectRadius_body_exited(_body):
	player = null
