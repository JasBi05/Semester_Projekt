extends Node2D
class_name Checkpoint 

@export var spawnpoint = false

var activated = false


func activate():
	Respawn.current_checkpoint = self
	activated = true
	print("Checkpoint activated at position:", self.global_position)


func _on_area_2d_body_entered(area):
	if area is Player:
		activate()
		print("Hat funktioniert")

