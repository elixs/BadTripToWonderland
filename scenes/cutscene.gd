extends Node2D

@onready var buer: Sprite2D = %Buer
@onready var target: Marker2D = $Target
@onready var target_2: Marker2D = $Target2
@onready var target_3: Marker2D = $Target3
@onready var target_4: Marker2D = $Target4
@onready var camera_targets: Node2D = %CameraTargets
@onready var camera_2d: Camera2D = $Camera2D



func _ready() -> void:
	Debug.log("start")
	await get_tree().create_timer(1).timeout
	_move_buer()
	var tween = create_tween()
	for camera_target in camera_targets.get_children():
		tween.tween_property(camera_2d, "global_position", camera_target.global_position, 2)
		tween.tween_interval(2)


func _move_buer():
	var tween = create_tween()
	tween.tween_property(buer, "global_position", target.global_position, 2).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(buer, "scale:x", 4, 2)
	tween.tween_property(buer, "global_position", target_2.global_position, 2)
	tween.tween_property(buer, "global_position", target_3.global_position, 2)
	tween.tween_property(buer, "global_position", target_4.global_position, 2)
	

