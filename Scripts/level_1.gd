extends Node2D

func _ready():
	var playerscene = load("res://scences/player.tscn")
	var player = playerscene.instantiate()
	add_child(player)
