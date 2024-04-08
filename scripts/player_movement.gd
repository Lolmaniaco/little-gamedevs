extends Node

var inside_hook_range: bool = false

func _ready():
	inside_hook_range = false
	
func get_movement_direction() -> float:
	return Input.get_axis("move_left", "move_right")

func wants_jump() -> bool:
	return Input.is_action_just_pressed("jump")

func pressed_action_button() -> bool:
	return Input.is_action_just_pressed("action")
