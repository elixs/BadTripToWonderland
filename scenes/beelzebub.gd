extends CharacterBody2D

@export var bullet_scene: PackedScene
@export var camera_enabled: bool = true
@export var speed = 200

var jump_speed = 300
var gravity = 600
var acceleration = 3000

var id = "beelzebub"


@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var pivot: Node2D = $Pivot
@onready var bullet_spawn: Marker2D = %BulletSpawn
@onready var attack_area: Area2D = $Pivot/AttackArea
@onready var jumps_label: Label = $JumpsLabel
@onready var jump_audio: AudioStreamPlayer = $JumpAudio
@onready var camera_2d: Camera2D = $Camera2D


func _ready() -> void:
	animation_tree.active = true
	attack_area.body_entered.connect(_on_attack_body_entered)
	Game.jumps_changed.connect(_update_jumps)
	_update_jumps()
	#camera_2d.enabled = camera_enabled
	
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
		
	var move_input = Input.get_axis("move_left", "move_right")
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		_jump()
		
	velocity.x = move_toward(velocity.x, move_input * speed, acceleration * delta)
	
	move_and_slide()
	
	if Input.is_action_just_pressed("fire"):
		fire()
	
	if Input.is_action_just_pressed("attack"):
		playback.travel("attack")
		return
	
	if Input.is_action_just_pressed("save"):
		Game.save_game()
	
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


func _jump():
	velocity.y = -jump_speed
	Game.jumps += 1
	jump_audio.play()


func _on_attack_body_entered(body: Node2D):
	if body.has_method("take_damage"):
		body.take_damage()


func fire():
	if not bullet_scene:
		return
	var bullet = bullet_scene.instantiate()
	get_parent().add_child(bullet)
	bullet.global_position = bullet_spawn.global_position
	bullet.global_rotation = bullet_spawn.global_position.direction_to(get_global_mouse_position()).angle()
	#bullet.look_at(bullet.global_position + Vector2(pivot.scale.x, 0))


func get_data():
	var data = {
		"pos_x" = position.x,
		"pos_y" = position.y,
		"speed" = speed
	}
	return data

func _update_jumps():
	jumps_label.text = str(Game.jumps)
