extends CharacterBody2D

const SPEED_E = 50
var active: bool = false
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			nav_agent.target_position = get_global_mouse_position()
			active = true


func _physics_process(_delta: float) -> void:
	if active:
		var next_path_pos := nav_agent.get_next_path_position()
		var direction := global_position.direction_to(next_path_pos)
		velocity = direction * SPEED_E
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()


func enable_npc() -> void:
	print("NPC activated")
	nav_agent.target_position = $"../CharacterBody2D".global_position
	active = true

func disable_npc() -> void:
	print("NPC Disabled\n")
	active = false

func _on_nav_agent_2d_target_reached() -> void:
	print("Reached target")
	disable_npc()


func _on_nav_agent_2d_navigation_finished() -> void:
	print("Navigation finished")
	disable_npc()

