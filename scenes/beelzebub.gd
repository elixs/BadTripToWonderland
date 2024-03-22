extends CharacterBody2D

@export var speed = 400
var jump_speed = 300
var gravity = 600
var acceleration = 3000

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var pivot: Node2D = $Pivot


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
		
	var move_input = Input.get_axis("move_left", "move_right")
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -jump_speed
	
	velocity.x = move_toward(velocity.x, move_input * speed, acceleration * delta)
	
	move_and_slide()
	
	# animation
	if is_on_floor():
		if abs(velocity.x) > 10 or move_input:
			playback.travel("walk")
		else:
			playback.travel("idle")
	else:
		if velocity.y < 0:
			playback.travel("jump")
		else:
			playback.travel("fall")
	
	if move_input:
		pivot.scale.x = sign(move_input)
