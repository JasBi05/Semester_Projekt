extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var playerscene = load("res://scences/player.tscn")
	var player = playerscene.instantiate()
	add_child(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
