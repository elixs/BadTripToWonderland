extends CharacterBody2D

var speed = 200
var gravity = 300
var acceleration = 1000
@onready var pivot: Node2D = $Pivot
@onready var floor_raycast: RayCast2D = $Pivot/FloorRaycast
@onready var wall_raycast: RayCast2D = $Pivot/WallRaycast


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	
	var direction = pivot.scale.x
	velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)
	
	move_and_slide()
	
	
	if not floor_raycast.is_colliding():
		pivot.scale.x *= -1
	
	if wall_raycast.is_colliding():
		pivot.scale.x *= -1
