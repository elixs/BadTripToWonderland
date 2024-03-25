extends Area2D

var speed = 400

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	#area_entered.connect(_on_area_entered)

func _physics_process(delta: float) -> void:
	position += speed * transform.x * delta

func _on_body_entered(body: Node2D):
	queue_free()

#func _on_area_entered(area: Area2D):
	#queue_free()
