extends CharacterBody2D

var speed = 100
var gravity = 300
var acceleration = 1000
@onready var pivot: Node2D = $Pivot
@onready var detection_area: Area2D = $DetectionArea
var target


func _ready() -> void:
	detection_area.body_entered.connect(_on_detection_entered)
	detection_area.body_exited.connect(_on_detection_exited)


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if target:
		var direction = global_position.direction_to(target.global_position).x
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)
	
	move_and_slide()
	
	if velocity.x != 0:
		pivot.scale.x = sign(velocity.x)


func _on_detection_entered(body: Node):
	target = body


func _on_detection_exited(body: Node):
	target = null
	velocity.x = 0
