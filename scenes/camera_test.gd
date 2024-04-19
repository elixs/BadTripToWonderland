extends Node2D

@export var camera_speed: float = 200
var _moving_left = false
var _moving_right = false
@onready var move_right: TextureRect = %MoveRight
@onready var move_left: TextureRect = %MoveLeft
@onready var camera_2d: Camera2D = $Camera2D

func _ready() -> void:
	move_left.mouse_entered.connect(_on_move_left_entered)
	move_left.mouse_exited.connect(_on_move_left_exited)
	move_right.mouse_entered.connect(func(): _moving_right = true)
	move_right.mouse_exited.connect(func(): _moving_right = false)


func _process(delta: float) -> void:
	if _moving_left and camera_2d.global_position.x > camera_2d.limit_left + 320:
		camera_2d.global_position.x -= camera_speed * delta
	if _moving_right and camera_2d.global_position.x < camera_2d.limit_right - 320:
		camera_2d.global_position.x += camera_speed * delta


func _on_move_left_entered():
	_moving_left = true


func _on_move_left_exited():
	_moving_left = false


