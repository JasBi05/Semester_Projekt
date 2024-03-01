extends Node2D

var bg_music := AudioStreamPlayer.new()

var death_pos2 = Vector2(456, -9)
# Called when the node enters the scene tree for the first time.

func _ready():

	# --- spawn Player ---

	#var playerscene = load("res://scences/player.tscn")

	#var player = playerscene.instantiate()

	#add_child(player)

	# ------

	bg_music.stream = load("res://assets/audio/Pack/3- Something's wrong.mp3")

	bg_music.autoplay = true

	add_child(bg_music)

	

func _on_player_killed():
	death_pos2.position 
	

