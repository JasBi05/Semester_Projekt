extends Node2D

var bg_music := AudioStreamPlayer.new()
var playerscene = preload("res://scences/player.tscn")
var player_instance

# Called when the node enters the scene tree for the first time.
func _ready():
	# --- spawn Player ---
	bg_music.stream = load("res://assets/audio/Pack/3- Something's wrong.mp3")
	bg_music.autoplay = true
	add_child(bg_music)

