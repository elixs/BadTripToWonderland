extends Node2D

signal action_pressed(value1, value2)
@onready var node_c: Node2D = $NodeC



#func _ready() -> void:
	## esto no se hace
	#get_node("../NodeD").wow()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action"):
		action_pressed.emit(1, 3)

func _process(delta: float) -> void:
	pass


func meow():
	Debug.log("meow")
	node_c.global_position = Vector2.ONE
