extends Node2D

func _ready():
	var level_1scene = load("res://scences/level_1.tscn")
	var level_1 = level_1scene.instantiate()
	add_child(level_1)
