extends Node2D

func _on_area_2d_area_entered(area):
	if area.is_in_group("Player"):
		var level_1scene = load("res://Scences/level_1.tscn")
		var level_1 = level_1scene.instantiate()
		add_child(level_1)
