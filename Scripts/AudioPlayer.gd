# AudioManager.gd

extends Node

var walk_sound: AudioStreamPlayer = AudioStreamPlayer.new()
var jump_sound: AudioStreamPlayer = AudioStreamPlayer.new()

func _ready():
	# Lade die Audio-Ressourcen
	walk_sound.stream = load("res://path/to/Walk_Normal.mp3")
	jump_sound.stream = load("res://path/to/JUMP.mp3")

	# Füge die Audio-Player dem Szenenbaum hinzu
	add_child(walk_sound)
	add_child(jump_sound)

func play_walk_sound():
	if not walk_sound.playing:
		walk_sound.play()

func stop_walk_sound():
	walk_sound.stop()

func play_jump_sound():
	if not jump_sound.playing:
		jump_sound.play()

func stop_jump_sound():
	jump_sound.stop()
