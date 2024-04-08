extends Node2D

@onready var player = $player
@onready var camera_2d = $Camera2D

func _ready():
	player.connect_camera(camera_2d)

