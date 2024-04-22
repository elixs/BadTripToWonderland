extends Node2D



var current_background

@onready var background_area_1: Area2D = $BackgroundArea1
@onready var background_area_2: Area2D = $BackgroundArea2

@onready var parallax_background_1: ParallaxBackground = $ParallaxBackground1
@onready var parallax_background_2: ParallaxBackground = $ParallaxBackground2



func _ready() -> void:
	background_area_1.body_entered.connect(_on_background_1_entered)
	background_area_2.body_entered.connect(_on_background_2_entered)
	current_background = parallax_background_1
	_change_opacity(1, parallax_background_1)
	_change_opacity(0, parallax_background_2)
	

func _on_background_1_entered(body: Node):
	if current_background != parallax_background_1:
		current_background = parallax_background_1
		var tween = create_tween()
		tween.tween_method(_change_opacity.bind(parallax_background_1), 0.0, 1.0, 1)
		tween.parallel().tween_method(_change_opacity.bind(parallax_background_2), 1.0, 0.0, 1)


func _on_background_2_entered(body: Node):
	if current_background != parallax_background_2:
		current_background = parallax_background_2
		var tween = create_tween()
		tween.tween_method(_change_opacity.bind(parallax_background_2), 0.0, 1.0, 1)
		tween.parallel().tween_method(_change_opacity.bind(parallax_background_1), 1.0, 0.0, 1)


func _change_opacity(value: float, background: ParallaxBackground):
	for child in background.get_children():
		child.modulate.a = value
