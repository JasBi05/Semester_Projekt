extends Node2D

var bg_music := AudioStreamPlayer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	# --- spawn Player ---
	#var playerscene = load("res://scences/player.tscn")
	#var player = playerscene.instantiate()
	#add_child(player)
	# ------
	
	# Called when the node enters the scene tree for the first time.

	bg_music.stream = load("res://assets/audio/Pack/1- Midnight Dreams.mp3")

	bg_music.autoplay = true

	add_child(bg_music)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
