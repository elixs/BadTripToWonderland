extends Node2D

@onready var camera_2d: Camera2D = $Camera2D


func _process(delta: float) -> void:
	camera_2d.global_position = get_global_mouse_position()
