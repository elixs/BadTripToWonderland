extends Camera2D

@export var amount = 7
@export var force = 20
@export var duration = 0.4


func shake():
	var tween = create_tween()
	var delta = duration / amount
	for i in amount:
		tween.tween_property(self, "offset", _get_random_offset(), delta).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "offset", Vector2.ZERO, delta).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)


func _get_random_offset():
	return Vector2(randf_range(-force, force), randf_range(-force, force))
