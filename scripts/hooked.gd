extends State

@export var fall_state: State
@export var jump_state: State

func enter() -> void:
	super()

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	if parent.velocity.y > 0:
		return fall_state
	
	var movement = get_movement_input() * move_speed
	
	if movement != 0:
		animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	return null
