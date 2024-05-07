extends Node2D


func _ready() -> void:
	## esto no se hace
	get_node("../NodeB").meow()
	##get_node("../NodeA").meh()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func wow():
	Debug.log("wow")
