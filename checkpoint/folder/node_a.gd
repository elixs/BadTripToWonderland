class_name NodeA
extends Node2D

@onready var node_e: Node2D = $NodeE

signal collided()
@export var owo = "123"

func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("collided"):
		collided.emit()
	if event.is_action_pressed("meh"):
		meh()

func _process(delta: float) -> void:
	pass


func meh():
	Debug.log("meh")
	node_e.global_position = Vector2.ONE * 1000
	Debug.log(owo)
