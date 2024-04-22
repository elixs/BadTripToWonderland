extends Sprite2D

@export var target: Marker2D
var _last_position
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")


func _ready() -> void:
	_last_position = global_position

	
func _physics_process(delta: float) -> void:
	if target:
		global_position = lerp(global_position, target.global_position, 5 * delta)
	var speed = (global_position - _last_position).length()
	#Debug.log(speed)
	if speed > 1:
		playback.travel("follow")
	else:
		playback.travel("idle")
	_last_position = global_position
	
