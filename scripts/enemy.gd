extends CharacterBody2D

var speed = 50
var player_position
var target_position
var leben = 1

@onready var player = get_parent().get_node("player")

func _physics_process(_delta):
	
	player_position = player.position
	target_position = (player_position - position).normalized()
	
	if position.distance_to(player_position) > 0:
		velocity = target_position * speed
		move_and_slide()
