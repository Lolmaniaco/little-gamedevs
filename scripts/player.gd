class_name Player
extends CharacterBody2D

@onready var movement_animations: AnimatedSprite2D = $movement_animations
@onready var movement_state_machine: Node = $movement_state_machine
@onready var player_movement: Node = $player_movement

@onready var camera_guide = $camera_guide

var inside_hook_range: bool = false

func _ready() -> void:
	movement_state_machine.init(self, movement_animations, player_movement)
	inside_hook_range = false

func connect_camera(camera) -> void:
	var camera_path = camera.get_path()
	camera_guide.remote_path = camera_path

func _unhandled_input(event: InputEvent) -> void:
	movement_state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	movement_state_machine.process_physics(delta)

func _process(delta: float) -> void:
	movement_state_machine.process_frame(delta)


func _on_player_detector_area_entered(area):
	if area.name == "Grappling Node":
		inside_hook_range = true
		print("1")


func _on_player_detector_area_exited(area):
	if area.name == "Grappling Node":
		inside_hook_range = false
		print("2")
