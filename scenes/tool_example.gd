@tool
extends Node2D

@export var texture: Texture

@export var color: Color:
	set(value):
		color = value
		if sprite_2d:
			sprite_2d.modulate = color

@export var godots: int = 1:
	set(value):
		godots = value
		if not v_box_container:
			return
		for child in v_box_container.get_children():
			v_box_container.remove_child(child)
			child.queue_free()
		for i in godots:
			var texture_rect = TextureRect.new()
			texture_rect.texture = texture
			v_box_container.add_child(texture_rect)

@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	self.godots = godots


func _process(delta: float) -> void:
	queue_redraw()


func _draw() -> void:
	draw_circle(position, 100, color)
