extends Node2D

#@onready var node_a: Node2D = $NodeA
#var node_a_scene = preload("res://checkpoint/folder/node_a.tscn")
@export var node_a_scene: PackedScene
@onready var node_b: Node2D = $NodeB
@onready var node_d: Node2D = $NodeD


func _ready() -> void:
	create_node_a()
	create_node_a()
	var xd = 25
	
	node_b.action_pressed.connect(_on_node_b_action_pressed.bind(xd))
	#node_b.action_pressed.connect(func (): node_d.owo())


func _process(delta: float) -> void:
	pass


func awa():
	Debug.log("awa")


func create_node_a():
	if not node_a_scene:
		return
	var node_a_inst = node_a_scene.instantiate()
	add_child(node_a_inst)
	#if node_a_inst.has_method("meh"):
		#node_a_inst.meh()
	var node_a = node_a_inst as NodeA
	if node_a:
		node_a.meh()
		node_a.collided.connect(_on_node_a_collided.bind(node_a))


func _on_node_a_collided(node_a):
	Debug.log("a collided")
	Debug.log(node_a.name)

func _on_node_b_action_pressed(value1, value2, value3):
	node_d.wow()
	Debug.log(value1)
	Debug.log(value2)
	Debug.log(value3)
